OltcOilContaminationFactor.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE oil_contamination_factors AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
orange = Color.find_by_name('orange')
red = Color.find_by_name('red')

OltcOilContaminationFactor.seed(
  {:hi_factor => 4, :condition => "Good", :start => nil, :end => 20, :color_id => green.id},
  {:hi_factor => 3, :condition => "Acceptable", :start => 21, :end => 30, :color_id => blue.id},
  {:hi_factor => 2, :condition => "Need Caution", :start => 31, :end => 40, :color_id => yellow.id},
  {:hi_factor => 1, :condition => "Poor", :start => 41, :end => 50, :color_id => orange.id},
  {:hi_factor => 0, :condition => "Very Poor", :start => 51, :end => nil, :color_id => red.id}
)
