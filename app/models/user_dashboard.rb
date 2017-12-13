# == Schema Information
#
# Table name: user_dashboards
#
#  id                 :integer          not null, primary key
#  name               :string
#  slug               :string
#  description        :string
#  content            :text
#  published          :boolean
#  summary            :text
#  private            :boolean
#  user_id            :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserDashboard < ApplicationRecord

  before_validation :parse_image

  attr_accessor :image_base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :photo

  validates_presence_of :name

  private

  def parse_image
    return if image_base.nil?
    image = Paperclip.io_adapters.for(image_base)
    image.original_filename = 'file.jpg'
    self.photo = image
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
