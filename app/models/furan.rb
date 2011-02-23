# == Schema Information
# Schema version: 20110223125749
#
# Table name: furans
#
#  id             :integer(4)      not null, primary key
#  acf            :float
#  fal            :float
#  fol            :float
#  hmf            :float
#  mef            :float
#  test_by        :string(255)
#  test_date      :datetime
#  work_order     :string(255)
#  perform_type   :integer(10)
#  transformer_id :integer(4)
#  test_type      :string(255)
#

class Furan < ActiveRecord::Base
  belongs_to :transformer

  def test_date_for_floth
    self.test_date.to_i * 1000
  end  

  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end

end
