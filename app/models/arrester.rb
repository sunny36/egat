class Arrester < ActiveRecord::Base
  belongs_to :transformer
  
  def watt_loss(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_watt").to_sym)
    else
      commissioning = self.send(("#{phase}_watt").to_sym)
    end
    watt = self.send(("#{phase}_watt").to_sym)
    return (100.0 * (watt - commissioning)) / commissioning
  end

  def insulation_resistance(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_insulation_resistance").to_sym)
    else
      commissioning = self.send(("#{phase}_insulation_resistance").to_sym)
    end
    insulation_resistance = self.send(("#{phase}_insulation_resistance").to_sym)
    return (100.0 * insulation_resistance) / commissioning
  end

  def leakage_current(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_leakage_current").to_sym)
    else
      commissioning = self.send(("#{phase}_leakage_current").to_sym)
    end
    leakage_current = self.send(("#{phase}_leakage_current").to_sym)
    return (100.0 * leakage_current) / commissioning
  end

end

# == Schema Information
#
# Table name: arresters
#
#  id                       :integer(4)      not null, primary key
#  h1_serial_number         :string(255)
#  h1_test_kv               :decimal(10, 2)
#  h1_current               :decimal(10, 2)
#  h1_watt                  :decimal(10, 2)
#  h1_insulation_resistance :decimal(10, 2)
#  h1_leakage_current       :decimal(10, 2)
#  h2_serial_number         :string(255)
#  h2_test_kv               :decimal(10, 2)
#  h2_current               :decimal(10, 2)
#  h2_watt                  :decimal(10, 2)
#  h2_insulation_resistance :decimal(10, 2)
#  h2_leakage_current       :decimal(10, 2)
#  h3_serial_number         :string(255)
#  h3_test_kv               :decimal(10, 2)
#  h3_current               :decimal(10, 2)
#  h3_watt                  :decimal(10, 2)
#  h3_insulation_resistance :decimal(10, 2)
#  h3_leakage_current       :decimal(10, 2)
#  x1_serial_number         :string(255)
#  x1_test_kv               :decimal(10, 2)
#  x1_current               :decimal(10, 2)
#  x1_watt                  :decimal(10, 2)
#  x1_insulation_resistance :decimal(10, 2)
#  x1_leakage_current       :decimal(10, 2)
#  x2_serial_number         :string(255)
#  x2_test_kv               :decimal(10, 2)
#  x2_current               :decimal(10, 2)
#  x2_watt                  :decimal(10, 2)
#  x2_insulation_resistance :decimal(10, 2)
#  x2_leakage_current       :decimal(10, 2)
#  x3_serial_number         :string(255)
#  x3_test_kv               :decimal(10, 2)
#  x3_current               :decimal(10, 2)
#  x3_watt                  :decimal(10, 2)
#  x3_insulation_resistance :decimal(10, 2)
#  x3_leakage_current       :decimal(10, 2)
#  y1_serial_number         :string(255)
#  y1_test_kv               :decimal(10, 2)
#  y1_current               :decimal(10, 2)
#  y1_watt                  :decimal(10, 2)
#  y1_insulation_resistance :decimal(10, 2)
#  y1_leakage_current       :decimal(10, 2)
#  y2_serial_number         :string(255)
#  y2_test_kv               :decimal(10, 2)
#  y2_current               :decimal(10, 2)
#  y2_watt                  :decimal(10, 2)
#  y2_insulation_resistance :decimal(10, 2)
#  y2_leakage_current       :decimal(10, 2)
#  y3_serial_number         :string(255)
#  y3_test_kv               :decimal(10, 2)
#  y3_current               :decimal(10, 2)
#  y3_watt                  :decimal(10, 2)
#  y3_insulation_resistance :decimal(10, 2)
#  y3_leakage_current       :decimal(10, 2)
#  transformer_id           :integer(4)
#  test_type                :string(255)
#  test_date                :date
#  work_order               :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#

