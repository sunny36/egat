# == Schema Information
# Schema version: 20110203165120
#
# Table name: winding_types
#
#  id          :integer(4)      not null, primary key
#  description :string(255)
#

class WindingType < ActiveRecord::Base
  belongs_to :transformer
end
