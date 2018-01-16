class AddTimestampsToUserDashboards < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :user_dashboards, null: true

    date = DateTime.new(2000, 1, 1)
    UserDashboard.update_all(created_at: date, updated_at: date)

    change_column_null :user_dashboards, :created_at, false
    change_column_null :user_dashboards, :updated_at, false
  end
end
