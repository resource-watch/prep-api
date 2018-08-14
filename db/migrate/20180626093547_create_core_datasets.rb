class CreateCoreDatasets < ActiveRecord::Migration[5.1]
  def change
    create_table :core_datasets do |t|
      t.string :title
      t.string :slug
      t.string :country_iso
      t.string :subcategory
      t.text :dataset_ids, array: true, default: []
      t.text :tags,        array: true, default: []

      t.timestamps
    end
  end
end
