class CreateUserDashboards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_dashboards do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.text :content
      t.boolean :published
      t.text :summary
      t.boolean :private
      t.string :user_id
    end

    add_attachment :user_dashboards, :photo
  end
end
