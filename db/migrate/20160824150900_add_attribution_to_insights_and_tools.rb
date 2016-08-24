class AddAttributionToInsightsAndTools < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :attribution, :string
    add_column :tools, :attribution, :string
  end
end
