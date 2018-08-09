class AddTagsToDashboards < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboards, :tags, :string, array: true, default: []
  end
end
