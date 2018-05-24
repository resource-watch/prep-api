# == Schema Information
#
# Table name: resources
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  url                :string
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  resource_type      :string
#  published          :boolean          default(FALSE)
#

class Resource < ApplicationRecord
  include Filterable

  before_validation :parse_image
  attr_accessor :image_base
  has_attached_file :photo, styles: { medium: "345x>", thumb: "100x>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :photo

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title
  validates_presence_of :resource_type
  validate :accepted_resource_type

  scope :published, -> (published) { where published: published }
  scope :resource_type, -> (resource_type) { where resource_type: resource_type }
  scope :production, -> { where(production: true) }
  scope :preproduction, -> { where(preproduction: true) }
  scope :staging, -> { where(staging: true) }

  def accepted_resource_type
    unless Resource.resource_types.include? resource_type
      errors.add(:resource_type, "is not a valid one")
    end
  end

  def self.resource_types
    [
      'Understanding Climate Change Impacts',
      'Climate Assessment & Preparedness Tools',
      'Climate Data Portals',
      'Multi-resource Platforms'
    ]
  end

  private

  def parse_image
    return if image_base.nil?
    image = Paperclip.io_adapters.for(image_base)
    image.original_filename = 'file.jpg'
    self.photo = image
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
