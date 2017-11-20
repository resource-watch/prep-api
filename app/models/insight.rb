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
  friendly_id :title, use: :slugged

  has_attached_file :image, styles: { large: "1280x1024>", medium: "680x480>", thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :partner, optional: :true

  def self.published(is_published = true)
    self.where(published: is_published)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
