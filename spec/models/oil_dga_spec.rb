require 'spec_helper'

describe OilDga do
  before(:each) do 
    @oil_dga = Factory.stub(:oil_dga)
  end
  
  
  it "should create Oil Dga" do
    oil_dga = Factory.create(:oil_dga)
    oil_dga.work_order.should eql("XXX")
  end
  
  context "CO2 score" do 
    it "should = 1" do
      @oil_dga.co2 = 3000; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(1)
    end    

    it "should = 2" do
      @oil_dga.co2 = 3200; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(2)
      @oil_dga.co2 = 3500; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(2)      
    end    

    it "should = 2" do
      @oil_dga.co2 = 3200; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(2)
      @oil_dga.co2 = 3500; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(2)      
    end    
    
    it "should = 3" do
      @oil_dga.co2 = 3501; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(3)
      @oil_dga.co2 = 3800; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(3)            
      @oil_dga.co2 = 4000; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(3)      
    end    
    
    it "should = 4" do
      @oil_dga.co2 = 4001; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(4)
      @oil_dga.co2 = 4300; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(4)            
      @oil_dga.co2 = 4500; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(4)      
    end    
    
    it "should = 5" do
      @oil_dga.co2 = 4501; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(5)
      @oil_dga.co2 = 4800; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(5)            
      @oil_dga.co2 = 5000; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(5)      
    end    

    it "should = 6" do
      @oil_dga.co2 = 5001; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(6)
      @oil_dga.co2 = 6000; 
      @oil_dga.save!
      @oil_dga.co2_score.should eql(6)            
    end        
  end  
  
  context "CO score" do 
    it "should = 1" do
      test_score([0, 700], 1)      
    end    

    it "should = 2" do
      test_score([701, 750, 800], 2)      
    end    

    it "should = 3" do
      test_score([801, 850, 900], 3) 
    end    
    
    it "should = 4" do
      test_score([901, 950, 1100], 4)            
    end    
    
    it "should = 5" do
      test_score([1101, 1200, 1300], 5)
    end    

    it "should = 6" do
      test_score([1301, 1500], 6)
    end
    
    def test_score(values, score)
      values.each do |value|
        @oil_dga.co = value
        @oil_dga.save!
        @oil_dga.co_score.should eql(score)
      end      
    end        
    
  end  

  context "H2 score" do     
    it "should = 1" do
      test_score([0, 100], 1)      
    end    

    it "should = 2" do
      test_score([101, 150, 200], 2)      
    end    

    it "should = 3" do
      test_score([201, 250, 300], 3) 
    end    
    
    it "should = 4" do
      test_score([301, 400, 500], 4)            
    end    
    
    it "should = 5" do
      test_score([501, 600, 700], 5)
    end    

    it "should = 6" do
      test_score([701, 1500], 6)
    end
    
    def test_score(values, score)
      values.each do |value|
        @oil_dga.h2 = value
        @oil_dga.save!
        @oil_dga.h2_score.should eql(score)
      end      
    end            
  end  

  context "CH4 score" do     
    it "should = 1" do
      test_score([0, 120], 1)      
    end    

    it "should = 2" do
      test_score([121, 130, 150], 2)      
    end    

    it "should = 3" do
      test_score([151, 170, 200], 3) 
    end    
    
    it "should = 4" do
      test_score([201, 300, 400], 4)            
    end    
    
    it "should = 5" do
      test_score([401, 500, 600], 5)
    end    

    it "should = 6" do
      test_score([601, 1500], 6)
    end
    
    def test_score(values, score)
      values.each do |value|
        @oil_dga.ch4 = value
        @oil_dga.save!
        @oil_dga.ch4_score.should eql(score)
      end      
    end            
  end  

  context "C2H2 score" do     
    def test_score(values, score)
      values.each do |value|
        @oil_dga.c2h2 = value
        @oil_dga.save!
        @oil_dga.c2h2_score.should eql(score)
      end      
    end    
                
    it "should = 1" do
      test_score([0, 3], 1)      
    end    
    
    it "should = 2" do
      test_score([4, 6, 10], 2)      
    end    
    
    it "should = 3" do
      test_score([11, 29, 50], 3) 
    end        
    
    it "should = 4" do
      test_score([51, 70, 100], 4)            
    end    
    
    it "should = 5" do
      test_score([101, 150, 200], 5)
    end    

    it "should = 6" do
      test_score([201, 1000], 6)
    end    
    
  end  

  context "C2H4 score" do     
    def test_score(values, score)
      values.each do |value|
        @oil_dga.c2h4 = value
        @oil_dga.save!
        @oil_dga.c2h4_score.should eql(score)
      end      
    end    
                
    it "should = 1" do
      test_score([0, 50], 1)      
    end    
    
    it "should = 2" do
      test_score([51, 60, 100], 2)      
    end    
    
    it "should = 3" do
      test_score([101, 120, 150], 3) 
    end        
    
    it "should = 4" do
      test_score([151, 200, 250], 4)            
    end    
    
    it "should = 5" do
      test_score([251, 300, 500], 5)
    end    
      
    it "should = 6" do
      test_score([501, 1000], 6)
    end    
    
  end  
 
  context "C2H6 score" do     
    def test_score(values, score)
      values.each do |value|
        @oil_dga.c2h6 = value
        @oil_dga.save!
        @oil_dga.c2h6_score.should eql(score)
      end      
    end    
                
    it "should = 1" do
      test_score([0, 65], 1)      
    end    
    
    it "should = 2" do
      test_score([66, 70, 100], 2)      
    end    
    
    it "should = 3" do
      test_score([101, 120, 150], 3) 
    end        
    
    it "should = 4" do
      test_score([151, 200, 250], 4)            
    end    
    
    it "should = 5" do
      test_score([251, 300, 500], 5)
    end    
      
    it "should = 6" do
      test_score([501, 1000], 6)
    end    
    
  end
  
  context "%DGAF" do
    it "should return correct correct %DGAF" do
      @oil_dga.co2 = 1000
      @oil_dga.co = 750
      @oil_dga.h2 = 250
      @oil_dga.ch4 = 300
      @oil_dga.c2h2 = 150
      @oil_dga.c2h4 = 1000
      @oil_dga.c2h6 = 1000
      @oil_dga.save!
      @oil_dga.percent_dgaf.should be_close(72.916, 0.01)
    end
  end

  context "Transformer AT-KT7A" do 
    it "should return correct scores" do
      @oil_dga.h2 = 47
      @oil_dga.ch4 = 12
      @oil_dga.c2h6 = 11
      @oil_dga.c2h4 = 0
      @oil_dga.c2h2 = 0
      @oil_dga.co = 694
      @oil_dga.co2 = 3635
      @oil_dga.save!
      @oil_dga.h2_score.should eql(1)
      @oil_dga.ch4_score.should eql(1)
      @oil_dga.c2h6_score.should eql(1)
      @oil_dga.c2h4_score.should eql(1)
      @oil_dga.c2h2_score.should eql(1)
      @oil_dga.co_score.should eql(1)
      @oil_dga.co2_score.should eql(3)
    end

    #it "should return correct %DGAF" do
      #@oil_dga.h2 = 47
      #@oil_dga.ch4 = 12
      #@oil_dga.c2h6 = 11
      #@oil_dga.c2h4 = 0
      #@oil_dga.c2h2 = 0
      #@oil_dga.co = 694
      #@oil_dga.co2 = 3635
      #@oil_dga.save!
      #@oil_dga.percent_dgaf.should be_close(18.75, 0.01)
    #end
  end
  
end

# == Schema Information
#
# Table name: oil_dgas
#
#  id             :integer(4)      not null, primary key
#  test_type      :string(255)
#  test_date      :date
#  work_order     :string(255)
#  co2            :integer(4)
#  co2_score      :integer(4)
#  co             :integer(4)
#  co_score       :integer(4)
#  h2             :integer(4)
#  h2_score       :integer(4)
#  ch4            :integer(4)
#  ch4_score      :integer(4)
#  c2h2           :integer(4)
#  c2h2_score     :integer(4)
#  c2h4           :integer(4)
#  c2h4_score     :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  c2h6           :integer(4)
#  c2h6_score     :integer(4)
#  transformer_id :integer(4)
#  c3h6           :integer(4)
#  c3h8           :integer(4)
#  o2             :integer(4)
#  n2             :integer(4)
#

