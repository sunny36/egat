require 'spec_helper'

describe TransformerControlCabinet do
  before(:each) do
    TransformerControlCabinet.send(:public, 
                                   *TransformerControlCabinet.
                                   private_instance_methods)
    @transformer_control_cabinet = Factory.build(:transformer_control_cabinet)
  end

  it "should return the correct fields" do
    transformer_control_cabinet = TransformerControlCabinet.new
    fields = ['corrosion', 'animal', 'control_humidity', 'pragen',
              'wiring_control']
    transformer_control_cabinet.fields.should =~ fields
  end


  it "should return the correct denominator" do
    transformer_control_cabinet = TransformerControlCabinet.new
    transformer_control_cabinet.denominator.should be_close(70.0, 0.01)
  end

  context "AT_KT7A" do
    it "should return correct %TCF" do
      @transformer_control_cabinet.corrosion  = score(1, :corrosion)
      @transformer_control_cabinet.animal = score(1, :animal)
      @transformer_control_cabinet.control_humidity = score(1, :control_humidity)
      @transformer_control_cabinet.pragen = score(2, :pragen)
      @transformer_control_cabinet.wiring_control = score(1, :wiring_control)
      @transformer_control_cabinet.percent_transformer_control_cabinet_factor.should be_close(42.86, 0.01)
    end

    def score(value, field_name)
      VisualInspectionCondition.
        where("name = ? AND table_name = 'transformer_control_cabinets' AND score = ?",
              field_name.to_s, value).first.id
    end
  end

end

# == Schema Information
#
# Table name: transformer_control_cabinets
#
#  id                   :integer(4)      not null, primary key
#  animal               :integer(10)
#  control_humidity     :integer(10)
#  corrosion            :integer(10)
#  pragen               :integer(10)
#  wiring_control       :integer(10)
#  visual_inspection_id :integer(4)
#

