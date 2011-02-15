class InsulatingOil < ActiveRecord::Base
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
end
