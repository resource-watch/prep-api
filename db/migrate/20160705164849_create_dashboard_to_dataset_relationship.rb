class CreateDashboardToDatasetRelationship < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dashboards, :datasets do |t|
      t.index :dashboard_id
      t.index :dataset_id
    end
  end
end
