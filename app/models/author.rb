# == Schema Information
#
# Table name: authors
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  url                     :string
#  contact_name            :string
#  contact_email           :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  thumbnail_file_name     :string
#  thumbnail_content_type  :string
#  thumbnail_file_size     :integer
#  thumbnail_updated_at    :datetime
#  logo_file_name          :string
#  logo_content_type       :string
#  logo_file_size          :integer
#  logo_updated_at         :datetime
#  white_logo_file_name    :string
#  white_logo_content_type :string
#  white_logo_file_size    :integer
#  white_logo_updated_at   :datetime
#  dashboard_id            :integer
#

class Author < ApplicationRecord
  has_attached_file :thumbnail, styles: { large: "345x>", medium: "260x>", thumb: "50x>" }
  has_attached_file :logo, styles: { medium: "260x>", thumb: "50x>" }
  has_attached_file :white_logo, styles: { medium: "260x>", thumb: "50x>" }

  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :white_logo, content_type: /\Aimage\/.*\z/

  belongs_to :dashboard
end
