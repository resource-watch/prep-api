class CreateDashboards < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.text :content
      t.attachment :image
      t.boolean :published, default: false

      t.belongs_to :partner
      t.belongs_to :indicator
    end
  end
end
