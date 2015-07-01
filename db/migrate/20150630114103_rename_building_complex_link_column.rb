class RenameBuildingComplexLinkColumn < ActiveRecord::Migration
  def change
    rename_column :building_complex_links, :building_comnplex_id, :building_complex_id
  end
end
