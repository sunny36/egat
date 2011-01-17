Factory.define :oil_dga do |oil_dga|
  oil_dga.test_type "Commisioning"
  oil_dga.test_date { Date.today.to_s }
  oil_dga.work_order "XXX"
  oil_dga.o2 0
  oil_dga.n2 0
  oil_dga.co2 0
  oil_dga.co 0
  oil_dga.h2 0
  oil_dga.ch4 0
  oil_dga.c2h2 0
  oil_dga.c2h4 0
  oil_dga.c2h6 0  
  oil_dga.c3h6 0
  oil_dga.c3h8 0
end