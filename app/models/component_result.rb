# == Schema Information
# Schema version: 20110507140343
#
# Table name: component_results
#
#  id                           :integer         not null, primary key
#  start_at                     :datetime
#  finish_at                    :datetime
#  component_id                 :integer
#  env                          :text
#  parameter                    :text
#  status                       :string(255)
#  folder                       :string(255)
#  result_file                  :string(255)
#  previous_component_result_id :integer
#  scenario_id                  :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#  canvas_task                  :integer
#  cad_version                  :string(255)
#  platform                     :string(255)
#


class ComponentResult < ActiveRecord::Base
  belongs_to :component
  belongs_to :previous_component_result, :class_name => 'ComponentResult'
  belongs_to :scenario

  validates :component_id, :presence => true
  # validates :folder, :presence => true, :uniqueness => true


  def update_status_to_error
    self.status = "error"
    self.save!
    update_status_of_previous_recursive("skipped", [id])
  end

  # "updated" is to avoid recursive infinite roop
  def update_status_of_previous_recursive(value, updated = [])
    comp_results = children
    logger.debug("(update_status_of_previous_recursive) " + comp_results.pretty_inspect)
    comp_results.each do |comp_res|
      next if updated.include?(comp_res.id)
      comp_res.status = value
      comp_res.save!
      updated << comp_res.id
      comp_res.update_status_of_previous_recursive(value, updated)
    end
  end

  def root
    prev = self.previous_component_result
    return self unless prev
    updated = [self.id, prev.id]
    while a = prev.previous_component_result
      prev = a
      raise "couldn't find root" if updated.include?(prev.id)
      updated << prev.id
    end
    return prev
  end

  def children
    ComponentResult.find_all_by_previous_component_result_id(self.id)
  end

  def self.roots
    where("previous_component_result_id IS NULL")
  end
end
