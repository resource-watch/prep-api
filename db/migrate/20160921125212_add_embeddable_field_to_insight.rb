class AddEmbeddableFieldToInsight < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :embeddable, :boolean, default: true
  end
end
