class CreateModelTypes < ActiveRecord::Migration
  def self.up
    create_table :model_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :model_types
  end
end
