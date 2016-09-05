# == Schema Information
#
# Table name: partners
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  url                     :string
#  contact_name            :string
#  contact_email           :string
#  logo_file_name          :string
#  logo_content_type       :string
#  logo_file_size          :integer
#  logo_updated_at         :datetime
#  published               :boolean          default(FALSE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  logo_dimensions         :string
#  white_logo_file_name    :string
#  white_logo_content_type :string
#  white_logo_file_size    :integer
#  white_logo_updated_at   :datetime
#  featured                :boolean
#  description             :text
#  thumbnail_file_name     :string
#  thumbnail_content_type  :string
#  thumbnail_file_size     :integer
#  thumbnail_updated_at    :datetime
#

class Partner < ApplicationRecord

  default_scope {order('name ASC') }

  has_attached_file :thumbnail, styles: { large: "345x150>", medium: "260x65>", thumb: "50x50>" }
  has_attached_file :logo, styles: { medium: "260x65>", thumb: "50x50>" }
  has_attached_file :white_logo, styles: { medium: "260x65>", thumb: "50x50>" }

  validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :white_logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private

  def self.published
    self.where(published: true)
  end

  def self.featured
    self.where(published: true, featured: true)
  end

end
