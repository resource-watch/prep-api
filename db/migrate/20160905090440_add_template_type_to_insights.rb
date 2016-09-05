class AddTemplateTypeToInsights < ActiveRecord::Migration[5.0]
  def change
    add_column :insights, :template_type, :integer, default: 0
  end
end
