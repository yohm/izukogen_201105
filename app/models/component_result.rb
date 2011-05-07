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

  validates :component_id, :presence => true
  # validates :folder, :presence => true, :uniqueness => true

  def root
    prev = self.previous_component_result
    return self unless prev
    max = 20  # ad-hoc code to avoid infinite loop
    while a = prev.previous_component_result and max > 0
      prev = a
      max -= 1 
    end
    return prev
  end

  def children
    ComponentResult.where( ["previous_component_result_id = ?", id] ).find_all do |x|
      x.id > id
    end
  end

  def self.roots
    where("previous_component_result_id IS NULL")
  end
end
