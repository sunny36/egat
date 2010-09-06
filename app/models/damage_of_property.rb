class DamageOfProperty < ActiveRecord::Base
  has_and_belongs_to_many :transformer_information
end
