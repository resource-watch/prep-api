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
#  content                 :text
#  partner_type            :string
#  production              :boolean          default(TRUE)
#  preproduction           :boolean          default(FALSE)
#  staging                 :boolean          default(FALSE)
#

class Partner < ApplicationRecord

  default_scope { order('name ASC') }

  has_attached_file :thumbnail, styles: { large: "345x>", medium: "260x>", thumb: "50x>" }
  has_attached_file :logo, styles: { medium: "260x>", thumb: "50x>" }
  has_attached_file :white_logo, styles: { medium: "260x>", thumb: "50x>" }

  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :white_logo, content_type: /\Aimage\/.*\z/
  validate :accepted_partner_type

  scope :production, -> { where(production: true) }
  scope :preproduction, -> { where(preproduction: true) }
  scope :staging, -> { where(staging: true) }

  def accepted_partner_type
    unless Partner.partner_types.include? partner_type
      errors.add(:partner_type, "is not a valid one")
    end
  end

  def self.partner_types
    [
      'Contributing partners',
      'Core partners',
      'Resource partners'
    ]
  end

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
