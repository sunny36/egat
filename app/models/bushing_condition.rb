# == Schema Information
# Schema version: 20110203165120
#
# Table name: bushing_conditions
#
#  id                   :integer(4)      not null, primary key
#  version              :integer(4)
#  test_by              :string(255)
#  test_date            :datetime
#  work_order           :string(255)
#  oil_color_hv         :integer(10)
#  oil_color_lv         :integer(10)
#  oil_color_tv         :integer(10)
#  oil_fail_hv          :integer(10)
#  oil_fail_lv          :integer(10)
#  oil_fail_tv          :integer(10)
#  oil_level_hv         :integer(10)
#  oil_level_lv         :integer(10)
#  oil_level_tv         :integer(10)
#  perform_type         :integer(10)
#  porcelain_clean_hv   :integer(10)
#  porcelain_clean_lv   :integer(10)
#  porcelain_clean_tv   :integer(10)
#  porcelain_status_hv  :integer(10)
#  porcelain_status_lv  :integer(10)
#  porcelain_status_tv  :integer(10)
#  transformer_id       :integer(10)
#  visual_inspection_id :integer(4)
#

class BushingCondition < ActiveRecord::Base
  belongs_to :transformer
  belongs_to :visual_inspection
  
  #----------------------------Validations--------------------------------------
  validates_presence_of :porcelain_status_hv, :message => "can't be blank"
  validates_presence_of :porcelain_clean_hv, :message => "can't be blank"
  validates_presence_of :oil_level_hv, :message => "can't be blank"
  validates_presence_of :oil_fail_hv, :message => "can't be blank"
  validates_presence_of :oil_color_hv, :message => "can't be blank"

  validates_presence_of :porcelain_status_lv, :message => "can't be blank"
  validates_presence_of :porcelain_clean_lv, :message => "can't be blank"
  validates_presence_of :oil_level_lv, :message => "can't be blank"
  validates_presence_of :oil_fail_lv, :message => "can't be blank"
  validates_presence_of :oil_color_lv, :message => "can't be blank"  

  #-----------------------------------------------------------------------------

  def hi_factor
    BushingConditionFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      return i.hi_factor if percent_bushing_condition_factor.round.between?(i.start, i.end)
    end
  end
  
  
   def percent_bushing_condition_factor(*args)
    if args.length == 1
      side = args.first
      return (numerator(side)/denominator(side)) * 100
    end
    hv = (numerator(:hv)/denominator(:hv)) * 100
    lv = (numerator(:lv)/denominator(:lv)) * 100
    unless tv_side.nil?
      tv = (numerator(:tv)/denominator(:tv)) * 100
      percent_factor = [hv, lv, tv].max
    else
      percent_factor = [hv, lv].max
    end
    return percent_factor
   end

   # Checks if any of the TV side field are nil.
   # Returns nil if any of the fields are nil.
   # Return true if all of the fields are not nil.
   def tv_side
     get_fields_for(:tv).each  do |field|
       if self.send(field).nil?
         return nil
       end
     end
     return true
   end
   
   def numerator(side)
    fields = get_fields_for(side)
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.find(self.send(f)).score.to_i * 
              VisualInspectionCondition.weight(f, :bushing_conditions)).to_f
    end 
    return sum
   end
  
  def denominator(side)
    fields = get_fields_for(side)
    sum = 0
    fields.each do |f|
      sum += (VisualInspectionCondition.max_score(f, :bushing_conditions) *
              VisualInspectionCondition.weight(f, :bushing_conditions)).to_f
    end
    return sum
  end
  
  def get_fields_for(side)
    fields = ['porcelain_status', 'porcelain_clean', 'oil_fail', 'oil_level', 
              'oil_color']
    if side == :hv
      fields.map {|item| item + '_hv'}
    elsif side == :lv
      fields.map {|item| item + '_lv'}      
    elsif side == :tv
      fields.map {|item| item + '_tv'}      
    end          
  end
end
