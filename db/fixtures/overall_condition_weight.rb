OverallConditionWeight.delete_all
ActiveRecord::Base.connection.execute('ALTER TABLE overall_condition_weights AUTO_INCREMENT = 1')


OverallConditionWeight.seed(
  {:name => "others", :text => "Others", :weight => 60},
  {:name => "oltc", :text => "OLTC", :weight => 40}
)
