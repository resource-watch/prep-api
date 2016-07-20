class AddLogoDimensionsToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :logo_dimensions, :string
  end
end
