class BushingTest < ActiveRecord::Base
  belongs_to :transformer

  attr_accessor :h1_c1_percent_power_factor_avg, :h1_c1_percent_power_factor_cor,
                :h1_c2_percent_power_factor_avg, :h1_c2_percent_power_factor_cor,
                :h2_c1_percent_power_factor_avg, :h2_c1_percent_power_factor_cor,
                :h2_c2_percent_power_factor_avg, :h2_c2_percent_power_factor_cor,
                :h3_c1_percent_power_factor_avg, :h3_c1_percent_power_factor_cor,
                :h3_c2_percent_power_factor_avg, :h3_c2_percent_power_factor_cor,
                :h0_c1_percent_power_factor_avg, :h0_c1_percent_power_factor_cor,
                :h0_c2_percent_power_factor_avg, :h0_c2_percent_power_factor_cor,
                :x1_c1_percent_power_factor_avg, :x1_c1_percent_power_factor_cor,
                :x1_c2_percent_power_factor_avg, :x1_c2_percent_power_factor_cor,
                :x2_c1_percent_power_factor_avg, :x2_c1_percent_power_factor_cor,
                :x2_c2_percent_power_factor_avg, :x2_c2_percent_power_factor_cor,
                :x3_c1_percent_power_factor_avg, :x3_c1_percent_power_factor_cor,
                :x3_c2_percent_power_factor_avg, :x3_c2_percent_power_factor_cor,
                :x0_c1_percent_power_factor_avg, :x0_c1_percent_power_factor_cor,
                :x0_c2_percent_power_factor_avg, :x0_c2_percent_power_factor_cor,
                :y1_c1_percent_power_factor_avg, :y1_c1_percent_power_factor_cor,
                :y1_c2_percent_power_factor_avg, :y1_c2_percent_power_factor_cor,
                :y2_c1_percent_power_factor_avg, :y2_c1_percent_power_factor_cor,
                :y2_c2_percent_power_factor_avg, :y2_c2_percent_power_factor_cor,
                :y3_c1_percent_power_factor_avg, :y3_c1_percent_power_factor_cor,
                :y3_c2_percent_power_factor_avg, :y3_c2_percent_power_factor_cor


    def h1_c1_percent_power_factor_cor
      return nil if self.new_record?
      percent_power_factor_cor_20c("h1")
    end

    def h2_c1_percent_power_factor_cor
      return nil if self.new_record?
      percent_power_factor_cor_20c("h2")
    end

    def h3_c1_percent_power_factor_cor
      return nil if self.new_record?
      percent_power_factor_cor_20c("h3")
    end
    
    def h0_c1_percent_power_factor_cor
      return nil if self.new_record?
      percent_power_factor_cor_20c("h0")
    end
    
    def h1_c2_percent_power_factor_avg
      return nil if self.new_record?
      percent_power_factor_average("h1", "c2")
    end

    def h2_c2_percent_power_factor_avg
      return nil if self.new_record?
      percent_power_factor_average("h2", "c2")
    end
    
    def h3_c2_percent_power_factor_avg
      return nil if self.new_record?
      percent_power_factor_average("h3", "c2")
    end
    
    def h0_c2_percent_power_factor_avg
      return nil if self.new_record?
      percent_power_factor_average("h0", "c2")
    end
    
    def test_date_for_floth
      self.test_date.to_time.to_i * 1000
    end

    def thai_test_date
      test_date.strftime("%d/%m/%Y")
    end

    def percent_power_factor_average(phase, cap)
      watt = self.send((phase + "_" + cap + "_" + "watt").to_sym)
      current = self.send((phase + "_" + cap + "_" + "current").to_sym)
      test_kv = self.send((phase + "_" + cap + "_" + "test_kv").to_sym)
      (watt * 100.0) / (current * test_kv)
    end

    def percent_power_factor_cor_20c(phase)
      self.percent_power_factor_average(phase, "c1") * self.cf
    end

    def percent_power_factor_cor_20c_score(phase)
      bushing_test_conditions = BushingTestCondition.where(:testing => "pf_20c")
      bushing_test_conditions.each do |i|
        i.start = 0 if i.start.nil?
        i.end = 1000000 if i.end.nil?
        if percent_power_factor_cor_20c(phase).round(2).between?(i.start, i.end)
          return i.score
        end
      end
      return bushing_test_conditions.first.score
    end
    
    def percent_power_factor_score(phase)
      bushing_test_conditions = BushingTestCondition.where(:testing => "pf")
      bushing_test_conditions.each do |i|
        i.start = 0 if i.start.nil?
        i.end = 1000000 if i.end.nil?
        if percent_power_factor_average(phase, "c1").round(2).between?(i.start, i.end)
          return i.score
        end
      end
      return bushing_test_conditions.first.score
    end
    
    def capacitance_score(phase, cap)
      capacitance = self.send(("#{phase}_#{cap}_capacitance").to_sym)
      capacitance_comm = self.class.where(:transformer_id => self.transformer_id).where(:test_type => "Commissoning").order("test_date DESC").first
      unless capacitance_comm.nil?
        capacitance_comm = capacitance_comm.send(("#{phase}_#{cap}_capacitance").to_sym)
      else
        capacitance_comm = capacitance
      end
      max = [capacitance, capacitance_comm].max
      min = [capacitance, capacitance_comm].min
      percent_capacitance = ((max.to_f - min.to_f) / min.to_f) * 100
      bushing_test_conditions = BushingTestCondition.where(:testing => cap)
      bushing_test_conditions.each do |i|
        i.start = 0 if i.start.nil?
        i.end = 1000000 if i.end.nil?
        if capacitance.between?(i.start, i.end)
          return i.score
        end
      end
      #return bushing_test_conditions.first.score
    end
    
    def percent_bushing_factor(phase)
      percent_power_factor_cor_20c_weight = BushingTestCondition.where(:testing => "pf_20c").first.weight
      percent_power_factor_weight = BushingTestCondition.where(:testing => "pf").first.weight
      c1_weight = BushingTestCondition.where(:testing => "c1").first.weight
      c2_weight = BushingTestCondition.where(:testing => "c1").first.weight
      numerator = (percent_power_factor_cor_20c_score(phase).to_f * percent_power_factor_cor_20c_weight.to_f) + 
                  (percent_power_factor_score(phase).to_f         * percent_power_factor_weight.to_f) + 
                  (capacitance_score(phase, "c1").to_f            * c1_weight.to_f) + 
                  (capacitance_score(phase, "c2").to_f            * c2_weight.to_f)
      denominator = (BushingTestCondition.where(:testing => "pf_20c").order("score DESC").first.score * percent_power_factor_cor_20c_weight) +
                    (BushingTestCondition.where(:testing => "pf").order("score DESC").first.score * percent_power_factor_cor_20c_weight) +
                    (BushingTestCondition.where(:testing => "c1").order("score DESC").first.score * percent_power_factor_cor_20c_weight) +
                    (BushingTestCondition.where(:testing => "c2").order("score DESC").first.score * percent_power_factor_cor_20c_weight)
      (numerator.to_f / denominator.to_f) * 100.0
    end
    
    def health_index_factor(phase)
      BushingTestFactor.all.each do |i|
        i.start = 0 if i.start.nil?
        i.end = 1000000 if i.end.nil?
        if percent_bushing_factor(phase).round.between?(i.start, i.end)
          return i.hi_factor
        end
      end
    end

end


# == Schema Information
#
# Table name: bushing_tests
#
#  id                  :integer(4)      not null, primary key
#  transformer_id      :integer(4)
#  test_type           :string(255)
#  test_date           :date
#  work_order          :string(255)
#  h1_c1_serial_number :string(255)
#  h1_c1_test_kv       :integer(4)
#  h1_c1_current       :decimal(10, 2)
#  h1_c1_watt          :decimal(10, 2)
#  h1_c1_capacitance   :decimal(10, 2)
#  h1_c1_remark        :string(255)
#  h1_c2_serial_number :string(255)
#  h1_c2_test_kv       :integer(4)
#  h1_c2_current       :decimal(10, 2)
#  h1_c2_watt          :decimal(10, 2)
#  h1_c2_capacitance   :decimal(10, 2)
#  h1_c2_remark        :string(255)
#  h2_c1_serial_number :string(255)
#  h2_c1_test_kv       :integer(4)
#  h2_c1_current       :decimal(10, 2)
#  h2_c1_watt          :decimal(10, 2)
#  h2_c1_capacitance   :decimal(10, 2)
#  h2_c1_remark        :string(255)
#  h2_c2_serial_number :string(255)
#  h2_c2_test_kv       :integer(4)
#  h2_c2_current       :decimal(10, 2)
#  h2_c2_watt          :decimal(10, 2)
#  h2_c2_capacitance   :decimal(10, 2)
#  h2_c2_remark        :string(255)
#  h3_c1_serial_number :string(255)
#  h3_c1_test_kv       :integer(4)
#  h3_c1_current       :decimal(10, 2)
#  h3_c1_watt          :decimal(10, 2)
#  h3_c1_capacitance   :decimal(10, 2)
#  h3_c1_remark        :string(255)
#  h3_c2_serial_number :string(255)
#  h3_c2_test_kv       :integer(4)
#  h3_c2_current       :decimal(10, 2)
#  h3_c2_watt          :decimal(10, 2)
#  h3_c2_capacitance   :decimal(10, 2)
#  h3_c2_remark        :string(255)
#  h0_c1_serial_number :string(255)
#  h0_c1_test_kv       :integer(4)
#  h0_c1_current       :decimal(10, 2)
#  h0_c1_watt          :decimal(10, 2)
#  h0_c1_capacitance   :decimal(10, 2)
#  h0_c1_remark        :string(255)
#  h0_c2_serial_number :string(255)
#  h0_c2_test_kv       :integer(4)
#  h0_c2_current       :decimal(10, 2)
#  h0_c2_watt          :decimal(10, 2)
#  h0_c2_capacitance   :decimal(10, 2)
#  h0_c2_remark        :string(255)
#  x1_c1_serial_number :string(255)
#  x1_c1_test_kv       :integer(4)
#  x1_c1_current       :decimal(10, 2)
#  x1_c1_watt          :decimal(10, 2)
#  x1_c1_capacitance   :decimal(10, 2)
#  x1_c1_remark        :string(255)
#  x1_c2_serial_number :string(255)
#  x1_c2_test_kv       :integer(4)
#  x1_c2_current       :decimal(10, 2)
#  x1_c2_watt          :decimal(10, 2)
#  x1_c2_capacitance   :decimal(10, 2)
#  x1_c2_remark        :string(255)
#  x2_c1_serial_number :string(255)
#  x2_c1_test_kv       :integer(4)
#  x2_c1_current       :decimal(10, 2)
#  x2_c1_watt          :decimal(10, 2)
#  x2_c1_capacitance   :decimal(10, 2)
#  x2_c1_remark        :string(255)
#  x2_c2_serial_number :string(255)
#  x2_c2_test_kv       :integer(4)
#  x2_c2_current       :decimal(10, 2)
#  x2_c2_watt          :decimal(10, 2)
#  x2_c2_capacitance   :decimal(10, 2)
#  x2_c2_remark        :string(255)
#  x3_c1_serial_number :string(255)
#  x3_c1_test_kv       :integer(4)
#  x3_c1_current       :decimal(10, 2)
#  x3_c1_watt          :decimal(10, 2)
#  x3_c1_capacitance   :decimal(10, 2)
#  x3_c1_remark        :string(255)
#  x3_c2_serial_number :string(255)
#  x3_c2_test_kv       :integer(4)
#  x3_c2_current       :decimal(10, 2)
#  x3_c2_watt          :decimal(10, 2)
#  x3_c2_capacitance   :decimal(10, 2)
#  x3_c2_remark        :string(255)
#  x0_c1_serial_number :string(255)
#  x0_c1_test_kv       :integer(4)
#  x0_c1_current       :decimal(10, 2)
#  x0_c1_watt          :decimal(10, 2)
#  x0_c1_capacitance   :decimal(10, 2)
#  x0_c1_remark        :string(255)
#  x0_c2_serial_number :string(255)
#  x0_c2_test_kv       :integer(4)
#  x0_c2_current       :decimal(10, 2)
#  x0_c2_watt          :decimal(10, 2)
#  x0_c2_capacitance   :decimal(10, 2)
#  x0_c2_remark        :string(255)
#  y1_c1_serial_number :string(255)
#  y1_c1_test_kv       :integer(4)
#  y1_c1_current       :decimal(10, 2)
#  y1_c1_watt          :decimal(10, 2)
#  y1_c1_capacitance   :decimal(10, 2)
#  y1_c1_remark        :string(255)
#  y1_c2_serial_number :string(255)
#  y1_c2_test_kv       :integer(4)
#  y1_c2_current       :decimal(10, 2)
#  y1_c2_watt          :decimal(10, 2)
#  y1_c2_capacitance   :decimal(10, 2)
#  y1_c2_remark        :string(255)
#  y2_c1_serial_number :string(255)
#  y2_c1_test_kv       :integer(4)
#  y2_c1_current       :decimal(10, 2)
#  y2_c1_watt          :decimal(10, 2)
#  y2_c1_capacitance   :decimal(10, 2)
#  y2_c1_remark        :string(255)
#  y2_c2_serial_number :string(255)
#  y2_c2_test_kv       :integer(4)
#  y2_c2_current       :decimal(10, 2)
#  y2_c2_watt          :decimal(10, 2)
#  y2_c2_capacitance   :decimal(10, 2)
#  y2_c2_remark        :string(255)
#  y3_c1_serial_number :string(255)
#  y3_c1_test_kv       :integer(4)
#  y3_c1_current       :decimal(10, 2)
#  y3_c1_watt          :decimal(10, 2)
#  y3_c1_capacitance   :decimal(10, 2)
#  y3_c1_remark        :string(255)
#  y3_c2_serial_number :string(255)
#  y3_c2_test_kv       :integer(4)
#  y3_c2_current       :decimal(10, 2)
#  y3_c2_watt          :decimal(10, 2)
#  y3_c2_capacitance   :decimal(10, 2)
#  y3_c2_remark        :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  cf                  :integer(10)
#

