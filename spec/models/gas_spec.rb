require 'spec_helper'

describe Gas do
  it "should return weight given gas name" do    
    Gas.weight("CO2").should eql(1)
    Gas.weight("CO").should eql(1)
    Gas.weight("H2").should eql(2)
    Gas.weight("CH4").should eql(3)
    Gas.weight("C2H2").should eql(5)
    Gas.weight("C2H4").should eql(3)
    Gas.weight("C2H6").should eql(1)
  end
end

# == Schema Information
#
# Table name: gas
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

