# == Schema Information
# Schema version: 20110115144540
#
# Table name: bushing_conditions
#
#  id                  :integer(4)      not null, primary key
#  version             :integer(4)
#  test_by             :string(255)
#  test_date           :datetime
#  work_order          :string(255)
#  oil_color_hv        :integer(10)
#  oil_color_lv        :integer(10)
#  oil_color_tv        :integer(10)
#  oil_fail_hv         :integer(10)
#  oil_fail_lv         :integer(10)
#  oil_fail_tv         :integer(10)
#  oil_level_hv        :integer(10)
#  oil_level_lv        :integer(10)
#  oil_level_tv        :integer(10)
#  perform_type        :integer(10)
#  porcelain_clean_hv  :integer(10)
#  porcelain_clean_lv  :integer(10)
#  porcelain_clean_tv  :integer(10)
#  porcelain_status_hv :integer(10)
#  porcelain_status_lv :integer(10)
#  porcelain_status_tv :integer(10)
#  transformer_id      :integer(10)
#

class BushingCondition < ActiveRecord::Base
  belongs_to :transformer

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
