class CreateWidgetTypesToWidgetsRelationship < ActiveRecord::Migration[5.0]
  def change
	   add_reference :widgets, :widget_type, index: true
  end
end
