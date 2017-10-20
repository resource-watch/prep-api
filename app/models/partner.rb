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

  default_scope { order('name ASC') }

  has_attached_file :thumbnail, styles: { large: "345#x150>", medium: "260#x65>", thumb: "50#x50>" }
  has_attached_file :logo, styles: { medium: "260#x65>", thumb: "50#x50>" }
  has_attached_file :white_logo, styles: { medium: "260#x65>", thumb: "50#x50>" }

  validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :white_logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private

  def self.published(is_published = true)
    self.where(published: is_published)
  end

  def self.featured(is_featured = true)
    self.where(featured: is_featured)
  end

  def self.partner_type(partner_type = 'partner')
    self.where(partner_type: partner_type)
  end

end
