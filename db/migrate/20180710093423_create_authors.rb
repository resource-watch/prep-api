class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :url
      t.string :contact_name
      t.string :contact_email

      t.timestamps
    end

    add_attachment :authors, :thumbnail
    add_attachment :authors, :logo
    add_attachment :authors, :white_logo
  end
end
