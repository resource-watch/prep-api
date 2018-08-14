class AddPublishedAndEnvironmentsToCoreDatasets < ActiveRecord::Migration[5.1]
  def change
    add_column :core_datasets, :published, :boolean, default: false
    add_column :core_datasets, :production, :boolean, default: true
    add_column :core_datasets, :preproduction, :boolean, default: false
    add_column :core_datasets, :staging, :boolean, default: false
  end
end
