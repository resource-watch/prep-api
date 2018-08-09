class AddDashboardIdToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :dashboard_id, :integer
  end
end
