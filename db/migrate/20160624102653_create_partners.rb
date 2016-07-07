class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name, null: false
      t.string :url
      t.string :contact_name
      t.string :contact_email
      t.attachment :logo
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
