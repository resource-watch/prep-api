class AddEnvironmentFieldToEntities < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboards, :production, :boolean, default: true
    add_column :dashboards, :pre_production, :boolean, default: false
    add_column :dashboards, :staging, :boolean, default: false
    add_column :insights, :production, :boolean, default: true
    add_column :insights, :pre_production, :boolean, default: false
    add_column :insights, :staging, :boolean, default: false
    add_column :partners, :production, :boolean, default: true
    add_column :partners, :pre_production, :boolean, default: false
    add_column :partners, :staging, :boolean, default: false
    add_column :resources, :production, :boolean, default: true
    add_column :resources, :pre_production, :boolean, default: false
    add_column :resources, :staging, :boolean, default: false
    add_column :tools, :production, :boolean, default: true
    add_column :tools, :pre_production, :boolean, default: false
    add_column :tools, :staging, :boolean, default: false
  end
end
