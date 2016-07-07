class UpdateDashboardRelationships < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dashboards, :insights do |t|
      t.index :dashboard_id
      t.index :insight_id
    end

    create_join_table :dashboards, :tools do |t|
      t.index :dashboard_id
      t.index :tool_id
    end
  end
end
