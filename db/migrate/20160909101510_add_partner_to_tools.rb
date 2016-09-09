class AddPartnerToTools < ActiveRecord::Migration[5.0]
  def change
    add_reference :tools, :partner, foreign_key: true
  end
end
