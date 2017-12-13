# == Schema Information
#
# Table name: dashboards
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  summary            :text
#  content            :text
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  published          :boolean          default(FALSE)
#  partner_id         :integer
#  indicator_id       :integer
#  related_datasets   :text             default([]), is an Array
#  attribution        :string
#  updated_at         :datetime
#  created_at         :datetime
#

class Dashboard < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_attached_file :image, styles: { large: "1280x1024>", medium: "680x480>", thumb: "100x100>" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :partner, optional: :true
  belongs_to :indicator

  accepts_nested_attributes_for :indicator

  has_and_belongs_to_many(:dashboards,
    :join_table => "dashboards_connections",
    :foreign_key => "dashboard_source_id",
    :association_foreign_key => "dashboard_target_id")

  has_and_belongs_to_many :insights
  accepts_nested_attributes_for :insights

  has_and_belongs_to_many :tools
  accepts_nested_attributes_for :tools

  before_save :sanitize_related_datasets

  def self.excluding_self(dashboard=nil)
    dashboards = Dashboard.all
    dashboards = dashboards.where.not(id: dashboard.id) if dashboard
    dashboards = dashboards.pluck(:title, :id)
  end

  def sanitize_related_datasets
    self.related_datasets = self.related_datasets.reject(&:blank?)
  end

  def self.published(is_published = true)
    self.where(published: is_published)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
