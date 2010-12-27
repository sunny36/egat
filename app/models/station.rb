# == Schema Information
# Schema version: 20101205200640
#
# Table name: stations
#
#  id         :integer(4)      not null, primary key
#  version    :integer(4)
#  full_name  :string(255)
#  kv         :integer(4)
#  name       :string(255)
#  region     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Station < ActiveRecord::Base
end
