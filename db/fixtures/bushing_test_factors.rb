BushingTestFactor.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE bushing_test_factors AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
orange = Color.find_by_name('orange')
red = Color.find_by_name('red')

BushingTestFactor.seed(
  {:hi_factor => 4, :condition => "Good", :start => 0, :end => 20, :color_id => green.id},
  {:hi_factor => 3, :condition => "Acceptable", :start => 20, :end => 30, :color_id => blue.id},
  {:hi_factor => 2, :condition => "Need Caution", :start => 30, :end => 40, :color_id => yellow.id},
  {:hi_factor => 1, :condition => "Poor", :start => 40, :end => 50, :color_id => orange.id},
  {:hi_factor => 0, :condition => "Very Poor", :start => 50, :end => nil, :color_id => red.id}
)
