class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :title
      t.string :summary
      t.string :slug
      t.text :content
      t.boolean :published
      t.belongs_to :partner

      t.timestamps
    end
  end
end
