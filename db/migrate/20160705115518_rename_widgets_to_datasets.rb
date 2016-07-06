class RenameWidgetsToDatasets < ActiveRecord::Migration[5.0]
  def change
    rename_table :widgets, :datasets
  end
end
