# == Schema Information
#
# Table name: insights
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  summary            :text
#  content            :text
#  content_url        :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  published          :boolean          default(FALSE)
#  partner_id         :integer
#  attribution        :string
#  template_type      :integer          default(0)
#  created_at         :datetime
#  updated_at         :datetime
#  embeddable         :boolean          default(TRUE)
#

class Insight < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_attached_file :image, styles: { large: "1280x>", medium: "680x>", thumb: "100x>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :partner, optional: :true

  scope :production, -> { where(production: true) }
  scope :pre_production, -> { where(pre_production: true) }
  scope :staging, -> { where(staging: true) }

  def self.published(is_published = true)
    self.where(published: is_published)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
