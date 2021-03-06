# == Schema Information
# Schema version: 20101205200640
#
# Table name: transformer_informations
#
#  id                                :integer(4)      not null, primary key
#  bus_voltage_hv_id                 :integer(4)
#  bus_voltage_lv_id                 :integer(4)
#  created_at                        :datetime
#  updated_at                        :datetime
#  system_fault_level_hv             :float
#  system_fault_level_lv             :float
#  probability_of_force_outage_id    :integer(4)
#  social_aspect_id                  :integer(4)
#  system_location_id                :integer(4)
#  application_use_id                :integer(4)
#  system_stability_id               :integer(4)
#  pollution_id                      :integer(4)
#  n1_criteria_id                    :integer(4)
#  public_image_id                   :integer(4)
#  system_fault_level_id             :integer(4)
#  transformer_id                    :integer(4)
#  recorded_date                     :date
#  bus_voltage_id                    :integer(4)
#  overall_condition                 :float
#  probability_of_force_outage_value :integer(4)
#  recent                            :boolean(1)
#

class TransformerInformation < ActiveRecord::Base
  scope :most_recent, lambda { where("recent = ?", true)}

  belongs_to :bus_voltage_hv
  belongs_to :bus_voltage_lv
  #belongs_to :probability_of_force_outage
  belongs_to :social_aspect, :class_name => "SocialAspect",  :foreign_key => "social_aspect_id"
  belongs_to :system_location, :class_name => "SystemLocation",  :foreign_key => "system_location_id"
  belongs_to :application_use, :class_name => "ApplicationUse",  :foreign_key => "application_use_id"
  belongs_to :system_stability, :class_name => "SystemStability",  :foreign_key => "system_stability_id"
  belongs_to :pollution, :class_name => "Pollution",  :foreign_key => "pollution_id"
  belongs_to :n1_criteria, :class_name => "N1Criteria", :foreign_key => "n1_criteria_id"
  belongs_to :public_image, :class_name => "PublicImage", :foreign_key => "public_image_id"
  belongs_to :system_fault_level, :class_name => "SystemFaultLevel",  :foreign_key => "system_fault_level_id"
  belongs_to :transformer, :class_name => "Transformer",  :foreign_key => "transformer_id"
  has_one :load_pattern_per_year
  has_and_belongs_to_many :damage_of_properties
  belongs_to :bus_voltage
  attr_accessor :system_fault_level_hv_mva, :system_fault_level_lv_mva, :transformer_name

  accepts_nested_attributes_for :load_pattern_per_year

  validate :transformer_name_must_be_valid, :at_least_one_damage_of_property_must_be_checked
  validates_presence_of :recorded_date, :bus_voltage_hv_id, :system_fault_level_hv, :bus_voltage_lv_id,
    :system_fault_level_lv, :probability_of_force_outage_value, :social_aspect_id,
    :system_location_id, :public_image_id, :n1_criteria_id, :application_use_id,
    :system_stability_id, :pollution_id, :overall_condition
  validates_numericality_of :system_fault_level_hv, :system_fault_level_lv
  before_create :update_recent

  def self.find_all_by_transformers(transformers)
    self.most_recent.where("transformer_id in (?)", transformers.collect { |t| t.id }).all
  end

  def self.get_data_points
    self.get_points(self.most_recent.order("id").includes(:transformer).all)
  end

  def self.get_data_points_by_transformers(transformers)
    self.get_points(self.most_recent.find_all_by_transformers(transformers))
  end

  def self.get_data_points_by_transformer_id(transformer_id)
    self.get_points([self.most_recent.find_by_transformer_id(transformer_id)])
  end

  def self.get_data_points_by_transformer_ids(transformer_ids)
    self.
      get_points(self.most_recent.find_all_by_transformer_id(transformer_ids))
  end

  def self.get_points(transformer_informations)
    points = []
    transformer_informations.each { |e|
      points << [e.transformer.transformer_name, e.importance_index, e.percent_hi]
    }
    return points
  end

  def risk
    risks = Risk.all
    risk = nil
    risks.each do |r|
      d = ((importance_index + percent_hi)/Math.sqrt(2))
      if d.round.between?(r.start, r.end)
        risk = r
      end
    end
    risk
  end

  def system_fault_level_score
    [system_fault_level_lv_score, system_fault_level_hv_score].max
  end

  #TODO This must be re-written
  def system_fault_level_score_message
    score = [system_fault_level_lv_score, system_fault_level_hv_score].max
    score_message = "Very Low" if score == 1
    score_message = "Low" if score == 2
    score_message = "Moderate" if score == 3
    score_message = "High" if score == 4
    score_message = "Very High" if score == 5    
    return score_message
  end
  
  def damage_of_property_score
    value = []
    self.damage_of_properties.each do |i|
      value << i.value.to_i
    end
    very_low = [1, 2, 3, 4]
    low = [[1,4], [3,4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
    moderate = [[1], [3], [4], [1, 2], [3, 2], [4, 2], [1,3]]
    high = [2]
    very_high = [5]
    @score = 0
    @score = 1 if (value - very_low).empty?
    low.each do |i|
      @score = 2 if (value - i).empty?
    end
    moderate.each do |i|
      @score = 3 if (value - i).empty?
    end
    @score = 4 if (value - high).empty?
    @score = 5 if (value - very_high).empty?
    return @score
  end
  
  #TODO This must be re-written
  def damage_of_property_score_message
    score_message = "Very Low" if damage_of_property_score == 1
    score_message = "Low" if damage_of_property_score == 2
    score_message = "Moderate" if damage_of_property_score == 3
    score_message = "High" if damage_of_property_score == 4
    score_message = "Very High" if damage_of_property_score == 5    
    return score_message    
  end
  
  def importance_index 
    return Rails.cache.fetch("importance_index.#{self.transformer_id}") unless Rails.cache.fetch("importance_index.#{self.transformer_id}").nil?
    ii = (((load_pattern_per_year.load_pattern_factor.score * 4) + 
      (system_location.score * 4) + 
      (n1_criteria.score * 5) + 
      (system_stability.score * 4) + 
      (application_use.score * 3)  + 
      (system_fault_level_score * 4) + 
      (probability_of_force_outage(:score) * 4) + 
      (damage_of_property_score * 3) + 
      (social_aspect.score * 3) + 
      (public_image.score * 1) + 
      (pollution.score * 1) + 
      (transformer.brand.score * 2)).to_f / 
           (denominator).to_f * 100.to_f )
      ii = ii.round(2)
      Rails.cache.write("importance_index.#{self.transformer_id}", ii)
      return ii
    end

    def denominator
      (5 * 4) + (6 * 4) + (5 * 5) + (5 * 4) + (4 * 3) + (5 * 4) + (5 * 4) + 
      (5 * 3) + (5 * 3) + (5 * 1) + (5 * 1) + (5 * 2)
    end

    def percent_hi
      transformer = self.transformer
      unless Rails.cache.fetch("overall_condition.#{transformer.id}").nil?
        return Rails.cache.fetch("overall_condition.#{transformer.id}")
      end
      percent_overall_health_index = (OverallCondition.percent_overall_health_index(Transformer.find(transformer_id)))
      if percent_overall_health_index.nil?
       percent_overall_health_index = 100 - overall_condition
      end
      Rails.cache.write("overall_condition.#{transformer.id}", percent_overall_health_index)
      return percent_overall_health_index
    end

    def importance
      ImportanceIndex.all.each do |ii|
        return ii if self.importance_index.between?(ii.start, ii.end)
      end
    end

    def action
      ImportanceIndex.all.each do |ii|
        return ii.action if self.importance_index.between?(ii.start, ii.end)
      end
    end

    def risk_probability
      RiskProbability.all.each do |rp|
        return rp if self.overall_condition.round.between?(rp.start, rp.end)
      end
    end

    def probability_of_force_outage(type)
      unless probability_of_force_outage_value.nil?
        probability_of_force_outages = ProbabilityOfForceOutage.all
        probability_of_force_outages.each do |p|
          #TODO Remove hard coded values
          p.end = 100 if p.end.nil?
          if self.probability_of_force_outage_value.between?(p.start, p.end)
            return p.score if type == :score
            return p.score_message if type == :score_message
          end
        end
      end
    end

    protected

      def update_recent
        self.recent = true
        id = self.transformer_id
        transformer_information = TransformerInformation.find_by_transformer_id_and_recent(id, true)
        unless transformer_information.nil?
          transformer_information.recent = false
          transformer_information.save
        end
      end

      def system_fault_level_hv_mva
        return nil if bus_voltage_hv.nil? || system_fault_level_hv.nil?
        1.732 * bus_voltage_hv.value.to_f * system_fault_level_hv.to_f
      end

      def system_fault_level_lv_mva
        return nil if bus_voltage_lv.nil? || system_fault_level_lv.nil?
        1.732 * bus_voltage_lv.value.to_f * system_fault_level_lv.to_f
      end

      def transformer_name_must_be_valid
        @transformer = Transformer.find(transformer_id) unless transformer_id.nil?
        errors.add_to_base('Please select a valid transformer') if @transformer.nil?
      end

      def at_least_one_damage_of_property_must_be_checked
        if damage_of_property_ids.nil? || damage_of_property_ids.empty?
          errors.add(:damage_of_properties, 'must have at least one checkbox ticked')
        end
      end


      def system_fault_level_hv_score
        @system_fault_levels = BusVoltage.system_fault_level(self.bus_voltage_hv.value.to_i)
        @system_fault_levels.each do |i|
          #TODO Remove hard coded number
          i.end = 100000000 if i.end.nil?
          if system_fault_level_hv_mva.between?(i.start, i.end)
            return i.score
          end
        end
      end

      def system_fault_level_lv_score
        @system_fault_levels = BusVoltage.system_fault_level(self.bus_voltage_lv.value.to_i)
        @system_fault_levels.each do |i|
          #TODO Remove hard coded number
          i.end = 100000000 if i.end.nil?
          if system_fault_level_lv_mva.between?(i.start, i.end)
            return i.score
          end
        end
      end
  end
