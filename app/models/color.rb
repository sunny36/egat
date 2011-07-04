class Color < ActiveRecord::Base
  has_many :oltc_oil_quality
  has_many :oil_quality
  has_many :oil_quality_factor
  has_many :aging_product_factor
  has_many :aging_product
  has_many :oil_contamination_factor
  has_many :insulating_oil_factor
  
end

# == Schema Information
#
# Table name: colors
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

