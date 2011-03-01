# == Schema Information
# Schema version: 20110215204448
#
# Table name: insulating_oils
#
#  id                    :integer(4)      not null, primary key
#  version               :integer(4)
#  ambient_temp          :float
#  cf                    :float
#  current_avg_maintank  :float
#  current_avg_oltc      :float
#  gap_distance_maintank :float
#  gap_distance_oltc     :float
#  humidity              :float
#  oil_temp              :float
#  remark_maintank       :string(255)
#  remark_oltc           :string(255)
#  test_by               :string(255)
#  test_date             :datetime
#  watt_avg_maintank     :float
#  watt_avg_oltc         :float
#  work_order            :string(255)
#  xi1_maintank          :float
#  xi1_oltc              :float
#  xi2_maintank          :float
#  xi2_oltc              :float
#  xi3_maintank          :float
#  xi3_oltc              :float
#  xi4_maintank          :float
#  xi4_oltc              :float
#  xi5_maintank          :float
#  xi5_oltc              :float
#  perform_type          :integer(10)
#  test_type             :string(255)
#  transformer_id        :integer(4)
#  test_kv_maintank      :integer(4)
#  test_kv_oltc          :integer(4)
#

class InsulatingOil < ActiveRecord::Base
  scope :most_recent, lambda { |transformer_id|
    where('transformer_id = ?', transformer_id).order('test_date DESC')
  }
  
  belongs_to :transformer
    
  attr_accessor :xi1_maintank_minus_xbar_whole_squared,
    :xi1_oltc_minus_xbar_whole_squared, :xi2_maintank_minus_xbar_whole_squared,
    :xi2_oltc_minus_xbar_whole_squared, :xi3_maintank_minus_xbar_whole_squared,
    :xi3_oltc_minus_xbar_whole_squared, :xi4_maintank_minus_xbar_whole_squared,
    :xi4_oltc_minus_xbar_whole_squared, :xi5_maintank_minus_xbar_whole_squared,
    :xi5_oltc_minus_xbar_whole_squared, :xi_sum_maintank, :xi_sum_oltc,
    :xi_average_maintank, :xi_average_oltc,
    :sum_xi_minus_xbar_whole_squared_maintank,
    :sum_xi_minus_xbar_whole_squared_oltc, :s_maintank, :s_oltc, :cv_maintank,
    :cv_oltc, :avg_percent_power_factor_maintank,
    :cor_percent_power_factor_maintank, :avg_percent_power_factor_oltc,
    :cor_percent_power_factor_oltc

  validates_presence_of :xi1_maintank, :xi2_maintank, :xi3_maintank,
    :xi4_maintank, :xi5_maintank, :xi1_oltc, :xi2_oltc, :xi3_oltc, :xi4_oltc,
    :xi5_oltc, :test_kv_maintank, :test_kv_oltc, :current_avg_maintank,
    :current_avg_oltc, :watt_avg_maintank, :watt_avg_oltc, :cf

  def test_date_for_floth
    self.test_date.to_i * 1000
  end

  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end

  def xi_sum_maintank
    if self.xi1_maintank.nil? || self.xi2_maintank.nil? ||
        self.xi3_maintank.nil? || self.xi4_maintank.nil? ||
        self.xi5_maintank.nil?
      return nil
    end
    self.xi1_maintank + self.xi2_maintank + self.xi3_maintank +
      self.xi4_maintank + self.xi5_maintank
  end

  def xi_sum_oltc
    if self.xi1_oltc.nil? || self.xi2_oltc.nil? || self.xi3_oltc.nil? ||
        self.xi4_oltc.nil? || self.xi5_oltc.nil?
      return nil
    end
    self.xi1_oltc + self.xi2_oltc + self.xi3_oltc + self.xi4_oltc + self.xi5_oltc
  end

  def xi_average_maintank
    return nil if self.xi_sum_maintank.nil?
    (self.xi_sum_maintank / 5).round(2)
  end

  def xi_average_oltc
    return nil if self.xi_sum_oltc.nil?
    (self.xi_sum_oltc / 5).round(2)
  end

  def xi1_maintank_minus_xbar_whole_squared
    return nil if self.xi_average_maintank.nil?
    (self.xi1_maintank - self.xi_average_maintank) ** 2
  end

  def xi2_maintank_minus_xbar_whole_squared
    return nil if self.xi_average_maintank.nil?
    (self.xi2_maintank - self.xi_average_maintank) ** 2
  end

  def xi3_maintank_minus_xbar_whole_squared
    return nil if self.xi_average_maintank.nil?
    (self.xi3_maintank - self.xi_average_maintank) ** 2
  end

  def xi4_maintank_minus_xbar_whole_squared
    return nil if self.xi_average_maintank.nil?
    (self.xi4_maintank - self.xi_average_maintank) ** 2
  end

  def xi5_maintank_minus_xbar_whole_squared
    return nil if self.xi_average_maintank.nil?
    (self.xi5_maintank - self.xi_average_maintank) ** 2
  end

  def xi1_oltc_minus_xbar_whole_squared
    return nil if self.xi_average_oltc.nil?
    (self.xi1_oltc - self.xi_average_maintank) ** 2
  end

  def xi2_oltc_minus_xbar_whole_squared
    return nil if self.xi_average_oltc.nil?
    (self.xi2_oltc - self.xi_average_maintank) ** 2
  end

  def xi3_oltc_minus_xbar_whole_squared
    return nil if self.xi_average_oltc.nil?
    (self.xi3_oltc - self.xi_average_maintank) ** 2
  end

  def xi4_oltc_minus_xbar_whole_squared
    return nil if self.xi_average_oltc.nil?
    (self.xi4_oltc - self.xi_average_maintank) ** 2
  end

  def xi5_oltc_minus_xbar_whole_squared
    return nil if self.xi_average_oltc.nil?
    (self.xi5_oltc - self.xi_average_maintank) ** 2
  end

  def sum_xi_minus_xbar_whole_squared_maintank
    return nil if self.xi_average_maintank.nil?
    self.xi1_maintank_minus_xbar_whole_squared +
      self.xi2_maintank_minus_xbar_whole_squared +
      self.xi3_maintank_minus_xbar_whole_squared +
      self.xi4_maintank_minus_xbar_whole_squared +
      self.xi5_maintank_minus_xbar_whole_squared
  end

  def sum_xi_minus_xbar_whole_squared_oltc
    return nil if self.xi_average_oltc.nil?
    self.xi1_oltc_minus_xbar_whole_squared +
      self.xi2_oltc_minus_xbar_whole_squared +
      self.xi3_oltc_minus_xbar_whole_squared +
      self.xi4_oltc_minus_xbar_whole_squared +
      self.xi5_oltc_minus_xbar_whole_squared
  end

  def s_maintank
    return nil if self.xi_average_maintank.nil?
    Math.sqrt(self.sum_xi_minus_xbar_whole_squared_maintank / 4.to_f)
  end

  def s_oltc
    return nil if self.xi_average_oltc.nil?
    Math.sqrt(self.sum_xi_minus_xbar_whole_squared_oltc / 4.to_f)
  end

  def cv_maintank
    return nil if self.xi_average_maintank.nil?
    (self.s_maintank / self.xi_average_maintank).round(2)
  end

  def cv_oltc
    return nil if self.xi_average_oltc.nil?
    (self.s_oltc / self.xi_average_oltc).round(2)
  end

  def avg_percent_power_factor_maintank
    if self.watt_avg_maintank.nil? || self.current_avg_maintank.nil? ||
        self.test_kv_maintank.nil?
      return nil
    end
    (self.watt_avg_maintank * (10**5)) /
    (self.current_avg_maintank * self.test_kv_maintank)
  end

  def avg_percent_power_factor_oltc
    if self.watt_avg_oltc.nil? || self.current_avg_oltc.nil? ||
        self.test_kv_oltc.nil?
      return nil
    end

    (self.watt_avg_oltc * (10**5)) /
    (self.current_avg_oltc * self.test_kv_oltc)
  end

  def cor_percent_power_factor_maintank
    if self.avg_percent_power_factor_maintank.nil? || self.cf.nil?
      return nil
    end
    self.avg_percent_power_factor_maintank * self.cf
  end

  def cor_percent_power_factor_oltc
    if self.avg_percent_power_factor_oltc.nil? || self.cf.nil?
      return nil
    end
    self.avg_percent_power_factor_oltc * self.cf
  end

end
