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
#

class Resource < ApplicationRecord
  before_validation :parse_image
  attr_accessor :image_base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :photo

  extend FriendlyId
  friendly_id :title, use: %i[slugged]

  validates_presence_of :title

  private

  def parse_image
    return if image_base.nil?
    image = Paperclip.io_adapters.for(image_base)
    image.original_filename = 'file.jpg'
    self.photo = image
  end
end
