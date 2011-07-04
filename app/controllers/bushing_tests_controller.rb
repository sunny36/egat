class BushingTestsController < ApplicationController
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @bushing_test = BushingTest.new 
  end
end
