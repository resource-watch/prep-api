class AddPublishedToToolsAndIndicators < ActiveRecord::Migration[5.0]
  def change
    add_column :indicators, :published, :boolean, default: false
    add_column :tools, :published, :boolean, default: false
  end
end
