require "pp"
require 'scenarios_helper'

class ScenariosController < ApplicationController
  include Canvas::CanvasHelper
  
  # GET /scenarios
  # GET /scenarios.xml
  def index
    @scenarios = Scenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scenarios }
    end
  end

  # GET /scenarios/1
  # GET /scenarios/1.xml
  def show
    @scenario = Scenario.find(params[:id])
    @component_results = @scenario.component_results
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scenario }
    end
  end

  # GET /scenarios/new
  # GET /scenarios/new.xml
  def new
    @scenario = Scenario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scenario }
    end
  end

  # GET /scenarios/1/edit
  def edit
    @scenario = Scenario.find(params[:id])
  end

  # POST /scenarios
  # POST /scenarios.xml
  def create
    @scenario = Scenario.new(params[:scenario])

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to(@scenario, :notice => 'Scenario was successfully created.') }
        format.xml  { render :xml => @scenario, :status => :created, :location => @scenario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scenarios/1
  # PUT /scenarios/1.xml
  def update
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        format.html { redirect_to(@scenario, :notice => 'Scenario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.xml
  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to(scenarios_url) }
      format.xml  { head :ok }
    end
  end

  # GET /scenarios/1/run
  def run
    @scenario = Scenario.find(params[:id])
    
    logger.debug("scenario run action (debug)")
    
    @scenario.component_results.each do |comp_res|
      if comp_res.status == "waiting" && comp_res.previous_component_result.status == "finished"
        run_canvas_scenario(comp_res)
      end
    end

    respond_to do |format|
      format.html { redirect_to(scenarios_url) }
      format.xml  { head :ok }
    end
  end

  # GET /scenarios/1/callback
  def callback
    @scenario = Scenario.find(params[:id])

    # do something
    
    respond_to do |format|
      format.html { redirect_to(scenarios_url) }
      format.xml  { head :ok }
    end
  end
end
