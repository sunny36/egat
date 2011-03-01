# == Schema Information
# Schema version: 20110223125749
#
# Table name: oil_contaminations
#
#  id             :integer(4)      not null, primary key
#  version        :integer(4)
#  color          :float
#  ift            :float
#  nn             :float
#  pf100          :float
#  pf20           :float
#  test_by        :string(255)
#  test_date      :datetime
#  water_content  :integer(4)
#  work_order     :string(255)
#  transformer_id :integer(4)
#  test_type      :integer(4)
#

class OilContamination < ActiveRecord::Base
  scope :most_recent, lambda { |transformer_id|
    where('transformer_id = ?', transformer_id).order('test_date DESC')
  }
  
  belongs_to :transformer
  
  validates_presence_of :test_date

  def test_date_for_floth
    self.test_date.to_i * 1000
  end
  
  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end

end
