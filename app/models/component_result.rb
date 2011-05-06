# == Schema Information
# Schema version: 20110506032020
#
# Table name: component_results
#
#  id                           :integer         not null, primary key
#  start_at                     :datetime
#  finish_at                    :datetime
#  component_id                 :integer
#  module_folder                :string(255)
#  env                          :text
#  parameter                    :text
#  status                       :string(255)
#  folder                       :string(255)
#  result_file                  :string(255)
#  previous_component_result_id :integer
#  scenario_id                  :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#


class ComponentResult < ActiveRecord::Base
  belongs_to :component
  belongs_to :previous_component_result, :class_name => 'ComponentResult'
  belongs_to :scenario
end
