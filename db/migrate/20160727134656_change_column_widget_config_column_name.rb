class ChangeColumnWidgetConfigColumnName < ActiveRecord::Migration[5.0]
  def change
     rename_column :widgets, :json_spec, :widget_config
  end
end
