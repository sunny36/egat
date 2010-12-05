Factory.define :oil_dga do |od|
  od.test_type "Commisioning"
  od.test_date { Date.today.to_s }
  od.work_order "XXX"
  od.co2 0
  od.co 0
  od.h2 0
  od.ch4 0
  od.c2h2 0
  od.c2h4 0
  od.c2h6 0  
end