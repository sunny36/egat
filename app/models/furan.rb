class Furan < ActiveRecord::Base
  belongs_to :transformer


  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end

end
