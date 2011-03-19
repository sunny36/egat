InsulatingOilWeight.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE insulating_oil_weights AUTO_INCREMENT = 1')

InsulatingOilWeight.seed(
  {:name => "oil_contamination", :description => "Oil Contamination", :weight => 100},
  {:name => "aging_product", :description => "Aging Product", :weight => 0}
)
