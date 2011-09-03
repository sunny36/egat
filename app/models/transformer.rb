# == Schema Information
# Schema version: 20110203165120
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
#  status              :integer(10)
#  winding_type_id     :integer(10)
#  brand_id            :integer(4)
#  position            :string(255)
#  oltc_manufacturer   :string(255)
#  oltc_type           :string(255)
#

class Transformer < ActiveRecord::Base
  set_table_name "transformer"
  belongs_to :brand
  has_many :transformer_information
  has_many :oil_dgas
  has_many :oltc_dgas
  has_many :furans
  has_many :oil_contamination
  has_many :oltc_oil_contamination
  has_many :visual_inspection
  has_many :insulating_oil
  has_many :winding_type
  has_many :bushing_tests

  delegate :name, :to => :brand, :prefix => true

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
