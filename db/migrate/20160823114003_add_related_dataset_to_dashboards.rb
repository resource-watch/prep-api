class AddRelatedDatasetToDashboards < ActiveRecord::Migration[5.0]
  def change
    add_column :dashboards, :related_datasets, :text, array:true, default: []
  end
end
