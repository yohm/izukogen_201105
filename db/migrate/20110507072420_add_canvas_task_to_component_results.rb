class AddCanvasTaskToComponentResults < ActiveRecord::Migration
  def self.up
    add_column :component_results, :canvas_task, :integer
  end

  def self.down
    remove_column :component_results, :canvas_task
  end
end
