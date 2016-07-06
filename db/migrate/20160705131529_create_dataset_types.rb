class CreateDatasetTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :dataset_types do |t|
      t.string :name, null: false
    end
  end
end
