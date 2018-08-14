class AddLocationsToDashboards < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboards, :locations, :string, array: true, default: []
  end
end
