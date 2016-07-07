class CreateIndicatorsToWidgetsRelationship < ActiveRecord::Migration[5.0]
  def change
    create_join_table :indicators, :widgets do |t|
      t.index :indicator_id
      t.index :widget_id
    end
  end
end
