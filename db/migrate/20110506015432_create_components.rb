class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :name
      t.string :class_name
      t.string :product_name
      t.integer :input_type_id
      t.integer :output_type_id
      t.string :canvas_component
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
