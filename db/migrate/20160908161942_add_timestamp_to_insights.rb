class AddTimestampToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :created_at, :datetime
    add_column :insights, :updated_at, :datetime
  end
end
