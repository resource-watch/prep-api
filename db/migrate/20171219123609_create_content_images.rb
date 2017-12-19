class CreateContentImages < ActiveRecord::Migration[5.1]
  def change
    create_table :content_images do |t|
      t.integer :dashboard_id

      t.timestamps
    end

    add_attachment :content_images, :image
  end
end
