# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110507072420) do

  create_table "component_results", :force => true do |t|
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer  "component_id"
    t.string   "module_folder"
    t.text     "env"
    t.text     "parameter"
    t.string   "status"
    t.string   "folder"
    t.string   "result_file"
    t.integer  "previous_component_result_id"
    t.integer  "scenario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "canvas_task"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "class_name"
    t.string   "product_name"
    t.integer  "input_type_id"
    t.integer  "output_type_id"
    t.string   "canvas_component"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenarios", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
