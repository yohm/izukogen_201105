class ComponentResultsController < ApplicationController
  # GET /component_results
  # GET /component_results.xml
  def index
    @component_results = ComponentResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @component_results }
    end
  end

  # GET /component_results/1
  # GET /component_results/1.xml
  def show
    @component_result = ComponentResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component_result }
    end
  end

  # GET /component_results/new
  # GET /component_results/new.xml
  def new
    @component_result = ComponentResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component_result }
    end
  end

  # GET /component_results/1/edit
  def edit
    @component_result = ComponentResult.find(params[:id])
  end

  # POST /component_results
  # POST /component_results.xml
  def create
    @component_result = ComponentResult.new(params[:component_result])

    respond_to do |format|
      if @component_result.save
        format.html { redirect_to(@component_result, :notice => 'Component result was successfully created.') }
        format.xml  { render :xml => @component_result, :status => :created, :location => @component_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /component_results/1
  # PUT /component_results/1.xml
  def update
    @component_result = ComponentResult.find(params[:id])

    respond_to do |format|
      if @component_result.update_attributes(params[:component_result])
        format.html { redirect_to(@component_result, :notice => 'Component result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /component_results/1
  # DELETE /component_results/1.xml
  def destroy
    @component_result = ComponentResult.find(params[:id])
    @component_result.destroy

    respond_to do |format|
      format.html { redirect_to(component_results_url) }
      format.xml  { head :ok }
    end
  end
end
