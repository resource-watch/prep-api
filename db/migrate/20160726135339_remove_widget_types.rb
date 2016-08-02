class RemoveWidgetTypes < ActiveRecord::Migration[5.0]
  def change
    drop_table :widget_types
    remove_column :widgets, :widget_type_id
  end
end
