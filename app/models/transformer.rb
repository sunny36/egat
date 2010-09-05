class Transformer < ActiveRecord::Base
  set_table_name "transformer"
  belongs_to :brand
  has_one :transformer_information
end