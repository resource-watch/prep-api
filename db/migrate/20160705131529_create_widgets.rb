class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :title
      t.string :summary
      t.string :slug
      t.string :data_url
      t.text :content
      t.text :json_spec
      t.boolean :published, default: false

      t.belongs_to :widget_type
      t.belongs_to :partner

      t.timestamps
    end
  end
end
