# == Schema Information
# Schema version: 20100906080424
#
# Table name: transformer
#
#  id                  :integer         primary key
#  version             :integer
#  contract            :string(255)
#  detail              :string(255)
#  egatsn              :string(255)
#  first_energize      :timestamp
#  hv                  :float
#  item                :integer
#  lv                  :float
#  manufacturingserial :string(255)
#  maxcapacity         :float
#  old_egatsn          :string(255)
#  phase               :integer
#  picture             :string(255)
#  transformer_name    :string(255)
#  tv                  :float
#  vector_group        :string(255)
#  first_substation    :decimal(, )
#  manufacturing       :decimal(, )
#  oltc_manufacturing  :decimal(, )
#  oltc_model          :decimal(, )
#  status              :decimal(, )
#  winding_type        :decimal(, )
#  brand_id            :integer
#

class Transformer < ActiveRecord::Base
  set_table_name "transformer"
  belongs_to :brand
  has_many :transformer_information
  
  def self.find_all_by_transformer_name_initials(names)
    conditions = "transformer_name like ?"
    names[1..names.length].each { |name|
      conditions += ' ' + 'OR transformer_name like ?'
    }
    names = names.map { |name| name + '-%'}
    x = [conditions] + names
    self.find(:all, :conditions => x)
  end
  
end
