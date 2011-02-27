class Color < ActiveRecord::Base
  has_many :oltc_oil_quality
  has_many :oil_quality
  has_many :oil_quality_factor
end
