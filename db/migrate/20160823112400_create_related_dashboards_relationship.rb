class CreateRelatedDashboardsRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table "dashboards_connections", :force => true, :id => false do |t|
      t.integer "dashboard_source_id", :null => false
      t.integer "dashboard_target_id", :null => false
    end
  end
end
