require 'spec_helper'

describe ThermoScan do
  before(:each) do
    # @thermo_scan = Factory.stub(:thermo_scan)
  end  


  context "AT-KT7A" do
    before(:each) do
      @thermo_scan = ThermoScan.new
      @thermo_scan.delt = 2.5
      @thermo_scan.load = 37
      @thermo_scan.save!
    end  

    it "should return correct HIF" do 
      @thermo_scan.hi_factor.should  == 3
    end
  end

   
end

# == Schema Information
#
# Table name: thermo_scans
#
#  id                   :integer(4)      not null, primary key
#  delt                 :float
#  load                 :float
#  visual_inspection_id :integer(4)
#

