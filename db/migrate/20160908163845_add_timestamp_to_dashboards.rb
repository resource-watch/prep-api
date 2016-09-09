class AddTimestampToDashboards < ActiveRecord::Migration[5.0]
  def change
    add_column :dashboards, :updated_at, :datetime
    add_column :dashboards, :created_at, :datetime
  end
end
