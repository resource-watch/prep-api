class CreateIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :indicators do |t|
      t.string :title
      t.text :summary
      t.text :content
    end
  end
end
