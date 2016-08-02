class AddDatasetAndDefaultVisualizationToWidget < ActiveRecord::Migration[5.0]
  def change
    add_column :widgets, :dataset, :string
    add_column :widgets, :visualization, :string 
  end
end
