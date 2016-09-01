class AddThumbnailToPartners < ActiveRecord::Migration[5.0]
  def change
    add_attachment :partners, :thumbnail

    remove_column :partners, :logo_dimensions
  end
end
