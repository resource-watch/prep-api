class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.text :summary
      t.string :url
    end
  end
end
