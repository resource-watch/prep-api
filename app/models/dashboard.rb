class Dashboard < ApplicationRecord

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :partner
  belongs_to :indicator

  accepts_nested_attributes_for :indicator

  has_and_belongs_to_many(:dashboards,
    :join_table => "dashboards_connections",
    :foreign_key => "dashboard_source_id",
    :association_foreign_key => "dashboard_target_id")

  has_and_belongs_to_many :insights
  accepts_nested_attributes_for :insights

  has_and_belongs_to_many :tools
  accepts_nested_attributes_for :tools

end
