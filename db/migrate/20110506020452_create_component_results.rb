class CreateComponentResults < ActiveRecord::Migration
  def self.up
    create_table :component_results do |t|
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :component_id
      t.string :module_folder
      t.text :env
      t.text :parameter
      t.string :status
      t.string :folder
      t.string :result_file
      t.integer :previous_component_result_id

      t.timestamps
    end
  end

  def self.down
    drop_table :component_results
  end
end
