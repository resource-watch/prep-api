class AddAttributionToDashboards < ActiveRecord::Migration[5.0]
  def change
  	add_column :dashboards, :attribution, :string
  end
end
