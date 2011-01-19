# == Schema Information
# Schema version: 20101205200640
#
# Table name: transformer
#
#  id                  :integer(4)      not null, primary key
#  version             :integer(4)
#  contract            :string(255)
#  detail              :string(255)
#  egatsn              :string(255)
#  first_energize      :datetime
#  hv                  :float
#  item                :integer(4)
#  lv                  :float
#  manufacturingserial :string(255)
#  maxcapacity         :float
#  old_egatsn          :string(255)
#  phase               :integer(4)
#  picture             :string(255)
#  transformer_name    :string(255)
#  tv                  :float
#  vector_group        :string(255)
#  first_substation    :integer(10)
#  manufacturing       :integer(10)
#  oltc_manufacturing  :integer(10)
#  oltc_model          :integer(10)
#  status              :integer(10)
#  winding_type        :integer(10)
#  brand_id            :integer(4)
#  position            :string(255)
#

class Transformer < ActiveRecord::Base
  set_table_name "transformer"
  belongs_to :brand
  has_many :transformer_information
  has_many :oil_dgas
  has_many :general_condition
  has_many :bushing_condition
  has_many :visual_inspection
  has_many :winding_type
  
  def self.find_all_by_transformer_name_initials(names)
    conditions = "transformer_name like ?"
    names[1..names.length].each { |name|
      conditions += ' ' + 'OR transformer_name like ?'
    }
    names = names.map { |name| name + '-%'}
    x = [conditions] + names
    self.where(x).all
  end

  def self.find_by_id_or_transformer_name(id)
    if id.to_i > 0
      transformer = Transformer.find_by_id(id) 
    else
      transformer = Transformer.find_by_id_or_transformer_name(id)
    end
  end
  
end
