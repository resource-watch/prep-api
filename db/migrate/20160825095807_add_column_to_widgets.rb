class AddColumnToWidgets < ActiveRecord::Migration[5.0]
  def change
    add_column :widgets, :attribution, :string
  end
end
