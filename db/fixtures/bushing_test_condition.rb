BushingTestCondition.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE bushing_test_conditions AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
orange = Color.find_by_name('orange')
red = Color.find_by_name('red')

BushingTestCondition.seed(
  {:testing => "pf_20c", :start => 0,    :end => 0.5, :score => 1, :score_message => "Good", :weight => 40, :color_id => green.id},
  {:testing => "pf_20c", :start => 0.51, :end => 0.6, :score => 2, :score_message => "",     :weight => 40, :color_id => blue.id},
  {:testing => "pf_20c", :start => 0.61, :end => 0.8, :score => 3, :score_message => "",     :weight => 40, :color_id => yellow.id},
  {:testing => "pf_20c", :start => 0.81, :end => 1.0, :score => 4, :score_message => "",     :weight => 40, :color_id => orange.id},
  {:testing => "pf_20c", :start => 1.0,  :end => nil, :score => 5, :score_message => "Poor", :weight => 40, :color_id => red.id},

  {:testing => "pf", :start => 0,    :end => 0.5, :score => 1, :score_message => "Good", :weight => 10, :color_id => green.id},
  {:testing => "pf", :start => 0.51, :end => 0.6, :score => 2, :score_message => "",     :weight => 10, :color_id => blue.id},
  {:testing => "pf", :start => 0.61, :end => 0.8, :score => 3, :score_message => "",     :weight => 10, :color_id => yellow.id},
  {:testing => "pf", :start => 0.81, :end => 1.0, :score => 4, :score_message => "",     :weight => 10, :color_id => orange.id},
  {:testing => "pf", :start => 1.0,  :end => nil, :score => 5, :score_message => "Poor", :weight => 10, :color_id => red.id},

  {:testing => "c1", :start => 0,    :end => 5,   :score => 1, :score_message => "Good", :weight => 40, :color_id => green.id},
  {:testing => "c1", :start => 5,  :end => nil,   :score => 5, :score_message => "Poor", :weight => 40, :color_id => red.id},

  {:testing => "c2", :start => nil,    :end => 1,   :score => 1, :score_message => "Good", :weight => 10, :color_id => green.id},
  {:testing => "c2", :start => 1,  :end => nil,   :score => 5, :score_message => "Poor", :weight => 10, :color_id => red.id},


)
