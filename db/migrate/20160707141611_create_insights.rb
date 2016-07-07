class CreateInsights < ActiveRecord::Migration[5.0]
  def change
    create_table :insights do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.text :content
      t.string :content_url
      t.attachment :image
      t.boolean :published, default: false

      t.belongs_to :partner
    end
  end
end
