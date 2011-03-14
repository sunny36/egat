AgingProductFactor.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE aging_product_factors AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
orange = Color.find_by_name('orange')
red = Color.find_by_name('red')

AgingProductFactor.seed(
  {:hi_factor => 4, :condition => "Good", :start => nil, :end => 25, :color_id => green.id},
  {:hi_factor => 3, :condition => "Acceptable", :start => 26, :end => 40, :color_id => blue.id},
  {:hi_factor => 2, :condition => "Need Caution", :start => 41, :end => 60, :color_id => yellow.id},
  {:hi_factor => 1, :condition => "Poor", :start => 61, :end => 80, :color_id => orange.id},
  {:hi_factor => 0, :condition => "Very Poor", :start => 81, :end => nil, :color_id => red.id}
)
