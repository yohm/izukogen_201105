require 'canvas/appif/client'
require 'canvas/common/base-utils'

module Canvas; module CanvasHelper
  def run_canvas_scenario(comp_res)
    logger.debug("run_canvas_scenario called")
    logger.debug(comp_res.pretty_inspect)
    callback_url = "http://rat2/component_results/#{comp_res.id}/callback"
    shared_work_path = comp_res.folder.to_path
    FileUtils.mkdir_p(shared_work_path)

    output_dir_path = shared_work_path + "output"
    scenario_name = "comp_res_#{comp_res.id}"
    input_path = comp_res.previous_component_result.result_file.to_path
    parameter = returning({}) do |result|
      comp_res.parameter.split("\n").each do |line|
        next unless line.include?("=")
        key, val = line.chomp.split("=")
        result[key.to_sym] = val
      end
    end
    env = returning({}) do |result|
      comp_res.env.split("\n").each do |line|
        next unless line.include?("=")
        key, val = line.chomp.split("=")
        result[key.to_sym] = val
      end
    end
    canvas_component = comp_res.component.canvas_component

    create_canvas_scenario(scenario_name,
      :canvas_component => canvas_component, :parameter => parameter, :env => env)

    task = CANVAS::AppIF::Client::Task.create do |t|
      t.name = scenario_name
      t.output_dir_url = output_dir_path.to_url
      t.shared_work_url = shared_work_path.to_url
      t.callback_url = callback_url
      # only to pass input check of CANVAS API
      t.input_set_list = CANVAS::AppIF::Client.create_input_resource_array([[input_path.to_url]])
      t.scenario_url = (scenario_dir_path + (scenario_name + ".rb")).to_url
      t.remove_task_file = false
    end
    return task.run
  end

  private

  def scenario_dir_path
    scenario_folder = ENV['SCENARIO_FOLDER']
    if scenario_folder.nil?
      msg = "Environment variable SCENARIO_FOLDER is not set"
      logger.fatal(msg)
      raise msg
    end
    scenario_folder.to_path
  end
  
  def template_dir_path
    "app/helpers/canvas".to_path
  end

  def create_canvas_scenario(scenario_name, d)
    scenario_path = scenario_dir_path + (scenario_name + ".rb")
    File.open(scenario_path, "w") do |f|
      f << ERB.new(IO.read(template_dir_path + "canvas_scenario.rb.erb")).result(binding)
    end
  end
end; end
