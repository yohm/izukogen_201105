class ComponentResultsController < ApplicationController
  include Canvas::CanvasHelper

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
    @component_result.status = "waiting"

    respond_to do |format|
      if @component_result.save and set_folder_path
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

  # GET /component_results/1/callback
  def callback
    @component_result = ComponentResult.find(params[:id])
    @component_result.status = 'finished'
    @component_result.result_file = output_file_of_canvas_task(@component_result).to_s

    @component_result.save!
    respond_to do |format|
      format.html { redirect_to(@component_result, :notice => 'Component result was successfully updated.') }
    end

    copy_canvas_result_to_folder(@component_result)

    comp_results = ComponentResult.find_all_by_previous_component_result_id(@component_result.id)
    logger.debug("previous_component_results: " + comp_results.pretty_inspect)
    comp_results.each do |comp_res|
      begin
        run_canvas_scenario(comp_res)
      rescue Exception => ex
        logger.error ex
      end
    end
  end

  private

  def set_folder_path
    basefolder = "BASE"
    class_name = @component_result.component.class_name
    prod_id = @component_result.component.product_name
    model_name = root_component_result(@component_result).result_file
    
    d = @component_result.created_at
    id = @component_result.id

    path = File.join( basefolder, class_name, prod_id, model_name, "#{d.to_date}_#{id}")
    @component_result.folder = path
    @component_result.save
  end

  def root_component_result( component_result )
    prev = component_result.previous_component_result
    return component_result unless prev
    max = 20
    while a = prev.previous_component_result and max > 0
      prev = a
      max -= 1 
    end
    return prev
  end
end
