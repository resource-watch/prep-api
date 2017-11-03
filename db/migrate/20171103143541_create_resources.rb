class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :slug

      t.timestamps
    end

    add_attachment :resources, :photo
  end
end
