class Furan < ActiveRecord::Base
  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end

end
