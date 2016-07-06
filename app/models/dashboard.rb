class Dashboard < ApplicationRecord

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :partner
  has_and_belongs_to_many :dataset
  accepts_nested_attributes_for :dataset, allow_destroy: true

end
