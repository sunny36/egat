# == Schema Information
# Schema version: 20110223125749
#
# Table name: oltc_dgas
#
#  id             :integer(4)      not null, primary key
#  c2h2           :float
#  c2h4           :float
#  c2h6           :float
#  ch4            :float
#  h2             :float
#  test_by        :string(255)
#  test_date      :datetime
#  work_order     :string(255)
#  oltc_type      :integer(10)
#  transformer_id :integer(10)
#  c3h6           :float
#  status         :string(255)
#  test_type      :string(255)
#

class OltcDga < ActiveRecord::Base
  belongs_to :transformer
  
  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end
  
end
