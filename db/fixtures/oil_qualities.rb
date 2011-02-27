OilQuality.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE oil_qualities AUTO_INCREMENT = 1')

green = Color.find_by_name('green')
blue = Color.find_by_name('blue')
yellow = Color.find_by_name('yellow')
red = Color.find_by_name('red')

OilQuality.seed(
  # Dielectric Breadkdown
  {:name => 'xbar', :u_start => nil, :u_end => 69, :start => 25, :end => nil, :score => 1, :weight => 3, 
   :color_id => green.id},
  {:name => 'xbar', :u_start => nil, :u_end => 69, :start => 23, :end => 24, :score => 2, :weight => 3,
   :color_id => blue.id},
  {:name => 'xbar', :u_start => nil, :u_end => 69, :start => 20, :end => 22, :score => 3, :weight => 3,
   :color_id => yellow.id},
  {:name => 'xbar', :u_start => nil, :u_end => 69, :start => nil, :end => 19, :score => 4, :weight => 3,
   :color_id => red.id},

  {:name => 'xbar', :u_start => 70, :u_end => 229, :start => 30, :end => nil, :score => 1, :weight => 3,
   :color_id => green.id},
  {:name => 'xbar', :u_start => 70, :u_end => 229, :start => 28, :end => 29, :score => 2, :weight => 3,
   :color_id => blue.id},
  {:name => 'xbar', :u_start => 70, :u_end => 229, :start => 20, :end => 27, :score => 3, :weight => 3,
   :color_id => yellow.id},
  {:name => 'xbar', :u_start => 70, :u_end => 229, :start => nil, :end => 19, :score => 4, :weight => 3,
   :color_id => red.id},

  {:name => 'xbar', :u_start => 230, :u_end => nil, :start => 32, :end => nil, :score => 1, :weight => 3,
   :color_id => green.id},
  {:name => 'xbar', :u_start => 230, :u_end => nil, :start => 30, :end => 31, :score => 2, :weight => 3,
   :color_id => blue.id},
  {:name => 'xbar', :u_start => 230, :u_end => nil, :start => 25, :end => 69, :score => 3, :weight => 3,
   :color_id => yellow.id},
  {:name => 'xbar', :u_start => 230, :u_end => nil, :start => nil, :end => 24, :score => 4, :weight => 3,
   :color_id => red.id},
  #-----------------------------------------------------------------------------------------------------

  # IFT
  {:name => 'ift', :u_start => nil, :u_end => 69, :start => 38, :end => nil, :score => 1, :weight => 2,
   :color_id => green.id},
  {:name => 'ift', :u_start => nil, :u_end => 69, :start => 25, :end => 37, :score => 2, :weight => 2,
   :color_id => blue.id},
  {:name => 'ift', :u_start => nil, :u_end => 69, :start => 22, :end => 24, :score => 3, :weight => 2,
   :color_id => yellow.id},
  {:name => 'ift', :u_start => nil, :u_end => 69, :start => nil, :end => 21, :score => 4, :weight => 2,
   :color_id => red.id},

  {:name => 'ift', :u_start => 70, :u_end => 229, :start => 38, :end => nil, :score => 1, :weight => 2,
   :color_id => green.id},
  {:name => 'ift', :u_start => 70, :u_end => 229, :start => 30, :end => 37, :score => 2, :weight => 2,
   :color_id => blue.id},
  {:name => 'ift', :u_start => 70, :u_end => 229, :start => 25, :end => 29, :score => 3, :weight => 2,
   :color_id => yellow.id},
  {:name => 'ift', :u_start => 70, :u_end => 229, :start => nil, :end => 24, :score => 4, :weight => 2,
   :color_id => red.id},

  {:name => 'ift', :u_start => 230, :u_end => nil, :start => 38, :end => nil, :score => 1, :weight => 2,
   :color_id => green.id},
  {:name => 'ift', :u_start => 230, :u_end => nil, :start => 32, :end => 37, :score => 2, :weight => 2,
   :color_id => blue.id},
  {:name => 'ift', :u_start => 230, :u_end => nil, :start => 25, :end => 31, :score => 3, :weight => 2,
   :color_id => yellow.id},
  {:name => 'ift', :u_start => 230, :u_end => nil, :start => nil, :end => 24, :score => 4, :weight => 2,
   :color_id => red.id},
  #-----------------------------------------------------------------------------------------------------

  # NN
  {:name => 'nn', :u_start => nil, :u_end => 69, :start => nil, :end => 0.015, :score => 1, :weight => 1,
   :color_id => green.id},
  {:name => 'nn', :u_start => nil, :u_end => 69, :start => 0.016, :end => 0.2, :score => 2, :weight => 1,
   :color_id => blue.id},
  {:name => 'nn', :u_start => nil, :u_end => 69, :start => 0.21, :end => 0.49, :score => 3, :weight => 1,
   :color_id => yellow.id},
  {:name => 'nn', :u_start => nil, :u_end => 69, :start => 0.5, :end => nil, :score => 4, :weight => 1,
   :color_id => red.id},

  {:name => 'nn', :u_start => 70, :u_end => 229, :start => nil, :end => 0.015, :score => 1, :weight => 1,
   :color_id => green.id},
  {:name => 'nn', :u_start => 70, :u_end => 229, :start => 0.016, :end => 0.1, :score => 2, :weight => 1,
   :color_id => blue.id},
  {:name => 'nn', :u_start => 70, :u_end => 229, :start => 0.11, :end => 0.49, :score => 3, :weight => 1,
   :color_id => yellow.id},
  {:name => 'nn', :u_start => 70, :u_end => 229, :start => 0.5, :end => nil, :score => 4, :weight => 1,
   :color_id => red.id},

  {:name => 'nn', :u_start => 230, :u_end => nil, :start => nil, :end => 0.015, :score => 1, :weight => 1,
   :color_id => green.id},
  {:name => 'nn', :u_start => 230, :u_end => nil, :start => 0.016, :end => 0.1, :score => 2, :weight => 1,
   :color_id => blue.id},
  {:name => 'nn', :u_start => 230, :u_end => nil, :start => 0.11, :end => 0.49, :score => 3, :weight => 1,
   :color_id => yellow.id},
  {:name => 'nn', :u_start => 230, :u_end => nil, :start => 0.5, :end => nil, :score => 4, :weight => 1,
   :color_id => red.id},
  #-----------------------------------------------------------------------------------------------------

  # Water Content
  {:name => 'water_content', :u_start => nil, :u_end => 69, :start => nil, :end => 20, :score => 1, :weight => 4,
   :color_id => green.id},
  {:name => 'water_content', :u_start => nil, :u_end => 69, :start => 21, :end => 35, :score => 2, :weight => 4,
   :color_id => blue.id},
  {:name => 'water_content', :u_start => nil, :u_end => 69, :start => 36, :end => 40, :score => 3, :weight => 4,
   :color_id => yellow.id},
  {:name => 'water_content', :u_start => nil, :u_end => 69, :start => 41, :end => nil, :score => 4, :weight => 4,
   :color_id => red.id},

  {:name => 'water_content', :u_start => 70, :u_end => 229, :start => nil, :end => 10, :score => 1, :weight => 4,
   :color_id => green.id},
  {:name => 'water_content', :u_start => 70, :u_end => 229, :start => 11, :end => 25, :score => 2, :weight => 4,
   :color_id => blue.id},
  {:name => 'water_content', :u_start => 70, :u_end => 229, :start => 26, :end => 30, :score => 3, :weight => 4,
   :color_id => yellow.id},
  {:name => 'water_content', :u_start => 70, :u_end => 229, :start => 31, :end => nil, :score => 4, :weight => 4,
   :color_id => red.id},

  {:name => 'water_content', :u_start => 230, :u_end => nil, :start => nil, :end => 10, :score => 1, :weight => 4,
   :color_id => green.id},
  {:name => 'water_content', :u_start => 230, :u_end => nil, :start => 11, :end => 20, :score => 2, :weight => 4,
   :color_id => blue.id},
  {:name => 'water_content', :u_start => 230, :u_end => nil, :start => 21, :end => 25, :score => 3, :weight => 4,
   :color_id => yellow.id},
  {:name => 'water_content', :u_start => 230, :u_end => nil, :start => 26, :end => nil, :score => 4, :weight => 4,
   :color_id => red.id},
  #-----------------------------------------------------------------------------------------------------

  # Water Content
  {:name => 'color', :start => nil, :end => 1.0, :score => 1, :weight => 2, :color_id => green.id},
  {:name => 'color', :start => 1.1, :end => 2.5, :score => 2, :weight => 2, :color_id => blue.id},
  {:name => 'color', :start => 2.6, :end => 4.0, :score => 3, :weight => 2, :color_id => yellow.id},
  {:name => 'color', :start => 4.1, :end => nil, :score => 4, :weight => 2, :color_id => red.id}
  #-----------------------------------------------------------------------------------------------------

)
