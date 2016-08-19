class AddWhiteLogoToPartners < ActiveRecord::Migration[5.0]
  def change
    add_attachment :partners, :white_logo
  end
end
