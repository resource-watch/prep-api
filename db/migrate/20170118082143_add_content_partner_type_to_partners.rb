class AddContentPartnerTypeToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :content, :text
    add_column :partners, :partner_type, :string
  end
end
