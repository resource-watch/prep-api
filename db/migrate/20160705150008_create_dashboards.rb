class CreateDashboards < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.string :slug
      t.text :summary
      t.attachment :image
      t.text :content
      t.boolean :published

      t.belongs_to :partner
    end
  end
end
