class BushingTest < ActiveRecord::Base
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


    def test_date_for_floth
      self.test_date.to_i * 1000
    end

    def thai_test_date
      test_date.strftime("%d/%m/%Y")
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
#

