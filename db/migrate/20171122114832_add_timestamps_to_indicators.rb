class AddTimestampsToIndicators < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :indicators, null: true

    date = DateTime.new(2000, 1, 1)
    Indicator.update_all(created_at: date, updated_at: date)

    change_column_null :indicators, :created_at, false
    change_column_null :indicators, :updated_at, false
  end
end
