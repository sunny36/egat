# == Schema Information
# Schema version: 20110111130021
#
# Table name: oil_dgas
#
#  id             :integer(4)      not null, primary key
#  test_type      :string(255)
#  test_date      :date
#  work_order     :string(255)
#  co2            :integer(4)
#  co2_score      :integer(4)
#  co             :integer(4)
#  co_score       :integer(4)
#  h2             :integer(4)
#  h2_score       :integer(4)
#  ch4            :integer(4)
#  ch4_score      :integer(4)
#  c2h2           :integer(4)
#  c2h2_score     :integer(4)
#  c2h4           :integer(4)
#  c2h4_score     :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  c2h6           :integer(4)
#  c2h6_score     :integer(4)
#  transformer_id :integer(4)
#  c3h6           :integer(4)
#  c3h8           :integer(4)
#  o2             :integer(4)
#  n2             :integer(4)
#

class OilDga < ActiveRecord::Base
  belongs_to :transformer
  
  before_save :set_co2_score, :set_co_score, :set_h2_score, :set_ch4_score, 
              :set_c2h2_score, :set_c2h4_score, :set_c2h6_score
  
  def percent_dgaf
    numerator = (self.co2_score * Gas.weight("CO2")) + 
                (self.co_score * Gas.weight("CO")) + 
                (self.h2_score * Gas.weight("H2")) + 
                (self.ch4_score * Gas.weight("CH4")) + 
                (self.c2h2_score * Gas.weight("C2H2")) + 
                (self.c2h4_score * Gas.weight("C2H4")) + 
                (self.c2h6_score * Gas.weight("C2H6"))
    denominator = (6 * Gas.weight("CO2")) + (6 * Gas.weight("CO")) + 
                  (6 * Gas.weight("H2")) + (6 * Gas.weight("CH4")) + 
                  (6 * Gas.weight("C2H2")) + (6 * Gas.weight("C2H4")) + 
                  (6 * Gas.weight("C2H6"))
    return (numerator.to_f / denominator.to_f) * 100.0  
  end
  
  # Validations
  validates_presence_of :co2, :on => :create, :message => "can't be blank"
  validates_presence_of :co, :on => :create, :message => "can't be blank"
  validates_presence_of :h2, :on => :create, :message => "can't be blank"
  validates_presence_of :ch4, :on => :create, :message => "can't be blank"
  validates_presence_of :c2h2, :on => :create, :message => "can't be blank"
  validates_presence_of :c2h4, :on => :create, :message => "can't be blank"
  validates_presence_of :c2h6, :on => :create, :message => "can't be blank"
  
  validates_numericality_of :o2, :on => :create, :message => "is not a number"
  validates_numericality_of :n2, :on => :create, :message => "is not a number"
  validates_numericality_of :co2, :on => :create, :message => "is not a number"
  validates_numericality_of :co, :on => :create, :message => "is not a number"
  validates_numericality_of :h2, :on => :create, :message => "is not a number"
  validates_numericality_of :ch4, :on => :create, :message => "is not a number"
  validates_numericality_of :c2h2, :on => :create, :message => "is not a number"
  validates_numericality_of :c2h4, :on => :create, :message => "is not a number"
  validates_numericality_of :c2h6, :on => :create, :message => "is not a number"
  validates_numericality_of :c3h6, :on => :create, :message => "is not a number"
  validates_numericality_of :c3h8, :on => :create, :message => "is not a number"
  #End Validations
  
  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end
  
  def hif_factor
    HifOfOilDga.all.each do |i|
      i.percent_dgaf_end = 10000000 if i.percent_dgaf_end.nil? 
      if percent_dgaf.between?(i.percent_dgaf_start, i.percent_dgaf_end)
        return i
      end
    end
  end
  
  def set_co2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CO2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.co2.between?(dga_gas_score.start, dga_gas_score.end)
        self.co2_score = dga_gas_score.score
      end
    end
  end
  
  def set_co_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CO")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.co.between?(dga_gas_score.start, dga_gas_score.end)
        self.co_score = dga_gas_score.score
      end
    end
  end

  def set_h2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "H2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.h2.between?(dga_gas_score.start, dga_gas_score.end)
        self.h2_score = dga_gas_score.score
      end
    end
  end

  def set_ch4_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "CH4")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.ch4.between?(dga_gas_score.start, dga_gas_score.end)
        self.ch4_score = dga_gas_score.score
      end
    end
  end

  def set_c2h2_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H2")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h2.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h2_score = dga_gas_score.score
      end
    end
  end

  def set_c2h4_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H4")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h4.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h4_score = dga_gas_score.score
      end
    end
  end

  def set_c2h6_score
    dga_gas_scores = DgaGasScore.joins(:gas).where("gas.name = ?", "C2H6")
    dga_gas_scores.each do |dga_gas_score|
      dga_gas_score.end = 10000000 if dga_gas_score.end.nil?
      if self.c2h6.between?(dga_gas_score.start, dga_gas_score.end)
        self.c2h6_score = dga_gas_score.score
      end
    end
  end
  
end
