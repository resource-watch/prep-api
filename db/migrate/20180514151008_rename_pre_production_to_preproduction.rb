class RenamePreProductionToPreproduction < ActiveRecord::Migration[5.1]
  def change
    rename_column :dashboards, :pre_production, :preproduction
    rename_column :insights, :pre_production, :preproduction
    rename_column :partners, :pre_production, :preproduction
    rename_column :resources, :pre_production, :preproduction
    rename_column :tools, :pre_production, :preproduction
  end
end
