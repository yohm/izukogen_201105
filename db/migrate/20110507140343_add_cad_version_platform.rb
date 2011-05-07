class AddCadVersionPlatform < ActiveRecord::Migration
  def self.up
    add_column :component_results, :cad_version, :string
    add_column :component_results, :platform, :string
    remove_column :component_results, :module_folder
    add_column :scenarios, :module_folder, :string
  end

  def self.down
    remove_column :component_results, :cad_version
    remove_column :component_results, :platform
    add_column :component_results, :module_folder, :string
    remove_column :scenarios, :module_folder
  end
end
