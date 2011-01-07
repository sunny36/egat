class OilDgasController < ApplicationController
  def index
    @oil_dgas = OilDga.find_all_by_transformer_id(params[:transformer_id])
    respond_to do |format|
      format.html # index.html.erb
      ActiveRecord::Base.include_root_in_json = false
      format.js { render :json => @oil_dgas.to_json }
    end
  end

  def show
    @oil_dga = OilDga.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /oil_dgas/new
  # GET /oil_dgas/new.xml
  def new
    @oil_dga = OilDga.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @oil_dga }
    end
  end

  # GET /oil_dgas/1/edit
  def edit
    @oil_dga = OilDga.find(params[:id])
  end

  # POST /oil_dgas
  # POST /oil_dgas.xml
  def create
    @oil_dga = OilDga.new(params[:oil_dga])
    respond_to do |format|
      if @oil_dga.save
        format.html { 
          redirect_to(@oil_dga, :notice => 'OilDga was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /oil_dgas/1
  # PUT /oil_dgas/1.xml
  def update
    @oil_dga = OilDga.find(params[:id])
    respond_to do |format|
      if @oil_dga.update_attributes(params[:oil_dga])
        format.html { 
          redirect_to(@oil_dga, :notice => 'OilDga was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /oil_dgas/1
  # DELETE /oil_dgas/1.xml
  def destroy
    @oil_dga = OilDga.find(params[:id])
    @oil_dga.destroy

    respond_to do |format|
      format.html { redirect_to(oil_dgas_url) }
      format.xml  { head :ok }
    end
  end
end
