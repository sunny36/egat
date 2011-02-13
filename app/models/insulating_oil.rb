class InsulatingOil < ActiveRecord::Base
  attr_accessor :xi1_maintank_minus_xbar_whole_squared,
                :xi1_oltc_minus_xbar_whole_squared,
                :xi2_maintank_minus_xbar_whole_squared,
                :xi2_oltc_minus_xbar_whole_squared,
                :xi3_maintank_minus_xbar_whole_squared,
                :xi3_oltc_minus_xbar_whole_squared,
                :xi4_maintank_minus_xbar_whole_squared,
                :xi4_oltc_minus_xbar_whole_squared,
                :xi5_maintank_minus_xbar_whole_squared,
                :xi5_oltc_minus_xbar_whole_squared
end
