class AddTimestampsToTools < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :tools, null: true

    date = DateTime.new(2000, 1, 1)
    Tool.update_all(created_at: date, updated_at: date)

    change_column_null :tools, :created_at, false
    change_column_null :tools, :updated_at, false
  end
end
