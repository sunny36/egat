class Arrester < ActiveRecord::Base
  belongs_to :transformer
  
  def test_date_for_floth
    self.test_date.to_time.to_i * 1000
  end

  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end
  
  def h1_percent_leakage_current
    percent_leakage_current("h1")
  end
  
  def h1_percent_watt_loss
    percent_watt_loss("h1")
  end
  
  def h1_percent_insulation_resistance
    percent_insulation_resistance("h1")
  end

  def h2_percent_leakage_current
    percent_leakage_current("h2")
  end
  
  def h2_percent_watt_loss
    percent_watt_loss("h2")
  end
  
  def h2_percent_insulation_resistance
    percent_insulation_resistance("h2")
  end

  def h3_percent_leakage_current
    percent_leakage_current("h3")
  end

  def h3_percent_watt_loss
    percent_watt_loss("h3")
  end
  
  def h3_percent_insulation_resistance
    percent_insulation_resistance("h3")
  end
  
  def x1_percent_leakage_current
    percent_leakage_current("x1")
  end
  
  def x1_percent_watt_loss
    percent_watt_loss("x1")
  end
  
  def x1_percent_insulation_resistance
    percent_insulation_resistance("x1")
  end

  def x2_percent_leakage_current
    percent_leakage_current("x2")
  end
  
  def x2_percent_watt_loss
    percent_watt_loss("x2")
  end
  
  def x2_percent_insulation_resistance
    percent_insulation_resistance("x2")
  end

  def x3_percent_leakage_current
    percent_leakage_current("x3")
  end

  def x3_percent_watt_loss
    percent_watt_loss("x3")
  end
  
  def x3_percent_insulation_resistance
    percent_insulation_resistance("x3")
  end

  def y1_percent_leakage_current
    percent_leakage_current("y1")
  end
  
  def y1_percent_watt_loss
    percent_watt_loss("y1")
  end
  
  def y1_percent_insulation_resistance
    percent_insulation_resistance("y1")
  end

  def y2_percent_leakage_current
    percent_leakage_current("y2")
  end
  
  def y2_percent_watt_loss
    percent_watt_loss("y2")
  end
  
  def y2_percent_insulation_resistance
    percent_insulation_resistance("y2")
  end

  def y3_percent_leakage_current
    percent_leakage_current("y3")
  end

  def y3_percent_watt_loss
    percent_watt_loss("y3")
  end
  
  def y3_percent_insulation_resistance
    percent_insulation_resistance("y3")
  end


  def percent_watt_loss(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_watt").to_sym)
    else
      commissioning = self.send(("#{phase}_watt").to_sym)
    end
    watt = self.send(("#{phase}_watt").to_sym)
    return (100.0 * (watt - commissioning)) / commissioning
  end

  def percent_insulation_resistance(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_insulation_resistance").to_sym)
    else
      commissioning = self.send(("#{phase}_insulation_resistance").to_sym)
    end
    insulation_resistance = self.send(("#{phase}_insulation_resistance").to_sym)
    return (100.0 * insulation_resistance) / commissioning
  end

  def percent_leakage_current(phase)
    commissioning = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
    unless commissioning.nil?
      commissioning = commissioning.send(("#{phase}_leakage_current").to_sym)
    else
      commissioning = self.send(("#{phase}_leakage_current").to_sym)
    end
    leakage_current = self.send(("#{phase}_leakage_current").to_sym)
    return (100.0 * leakage_current) / commissioning
  end

  def percent_arrester_factor(phase)
    leakage_current_score = score("leakage_current", percent_leakage_current(phase))
    watt_loss_score = score("watt_loss", percent_watt_loss(phase))
    insulation_resistance = score("insulation_resistance", percent_insulation_resistance(phase))
    numerator = (leakage_current_score * weight("leakage_current")) +
                (watt_loss_score * weight("watt_loss"))
                (insulation_resistance * weight("insulation_resistance"))
    denominator = (score_max("leakage_current") * weight("leakage_current")) + 
                  (score_max("watt_loss") * weight("watt_loss"))
                  (score_max("insulation_resistance") * weight("insulation_resistance"))
    return ((numerator.to_f / denominator.to_f) * 100.0)
  end
  
  def health_index_factor(phase)
    ArresterFactor.all.each do |i|
      i.start = 0 if i.start.nil?
      i.end = 1000000 if i.end.nil?
      if percent_arrester_factor(phase).round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end
  
  
  def score(testing, value)
    arrester_conditions = ArresterCondition.where(testing: testing)
    arrester_conditions.each do |x|
      x.start = 0 if x.start.nil?
      x.end = 10000000 if x.end.nil?
      if value.round.between?(x.start, x.end)
        return x.score
      end
    end
    arrester_conditions.first.score
  end
  
  def weight(testing)
    puts testing
    ArresterCondition.where(:testing => testing).first.weight
  end
  
  def score_max(testing)
    ArresterCondition.where(testing: testing).order("score DESC").first.score
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

