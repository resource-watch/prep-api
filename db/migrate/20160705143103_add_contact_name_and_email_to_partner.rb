class AddContactNameAndEmailToPartner < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :contact_name, :string
    add_column :partners, :contact_email, :string
  end
end
