class CreateComponentResults < ActiveRecord::Migration
  def self.up
    create_table :component_results do |t|
      t.datetime :start_at
      t.datetime :finish_at
      t.belongs_to :component
      t.string :module_folder
      t.text :env
      t.text :parameter
      t.string :status
      t.string :folder
      t.string :result_file
      t.belongs_to :previous_component_result, :class_name => 'ComponentResult'

      t.timestamps
    end
  end

  def self.down
    drop_table :component_results
  end
end
