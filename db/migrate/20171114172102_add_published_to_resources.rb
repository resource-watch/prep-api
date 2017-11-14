class AddPublishedToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :published, :boolean, default: false
  end
end
