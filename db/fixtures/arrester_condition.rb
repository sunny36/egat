ArresterCondition.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE arrester_conditions AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
orange = Color.find_by_name('orange')
red = Color.find_by_name('red')

ArresterCondition.seed(
  {:testing => "leakage_current", :start => nil, :end => 149,   :score => 1, :score_message => "Good", :weight => 40, :color_id => green.id},
  {:testing => "leakage_current", :start => 150,  :end => nil,   :score => 5, :score_message => "Poor", :weight => 40, :color_id => red.id},

  {:testing => "watt_loss", :start => nil, :end => 50,   :score => 1, :score_message => "Good", :weight => 50, :color_id => green.id},
  {:testing => "watt_loss", :start => 50,  :end => nil,   :score => 5, :score_message => "Poor", :weight => 50, :color_id => red.id},

  {:testing => "insulation_resistance", :start => 51, :end => nil, :score => 1, :score_message => "Good", :weight => 10, :color_id => green.id},
  {:testing => "insulation_resistance", :start => nil,  :end => 50, :score => 5, :score_message => "Poor", :weight => 10, :color_id => red.id},

)
