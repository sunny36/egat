class ArresterConditionsController < ApplicationController
  def index
    @arrester_conditions = ArresterCondition.where(:testing => params[:testing])
    respond_to do |format|
      format.html
      ActiveRecord::Base.include_root_in_json = false
      format.js { render :json => @arrester_conditions.to_json(:include => [:color]) }
    end
  end
end
