class UpdateDatasetFields < ActiveRecord::Migration[5.0]
  def change
    add_reference :datasets, :dataset_type
    add_column :datasets, :json_spec, :text
    add_column :datasets, :data_url, :string
  end
end
