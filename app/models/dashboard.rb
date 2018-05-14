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
#  user_id            :string
#

class Dashboard < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :content_images, dependent: :destroy

  has_attached_file :image, styles: { large: "1280x>", medium: "680x>", thumb: "100x>" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :partner, optional: :true
  belongs_to :indicator, optional: :true

  accepts_nested_attributes_for :indicator

  scope :production, -> { where(production: true) }
  scope :pre_production, -> { where(pre_production: true) }
  scope :staging, -> { where(staging: true) }

  has_and_belongs_to_many(:dashboards,
    :join_table => "dashboards_connections",
    :foreign_key => "dashboard_source_id",
    :association_foreign_key => "dashboard_target_id")

  has_and_belongs_to_many :insights
  accepts_nested_attributes_for :insights

  has_and_belongs_to_many :tools
  accepts_nested_attributes_for :tools

  before_save :sanitize_related_datasets

  scope :user_id, ->(user_id) {
    where(user_id: user_id)
  }

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

  def manage_content(base_url)
    content_images.each(&:destroy)
    contents = JSON.parse(content)

    contents.each do |content_block|
      if content_block['type'] == 'image'
        contents = assign_content_image_url(contents, content_block, base_url)
      elsif content_block['type'] == 'grid'
        content_block['content'].each do |content|
          if content && content['type'] == 'image'
            contents = assign_content_image_url(contents, content, base_url, is_grid = true, grid = content_block)
          end
        end
      end
    end

    update_column(:content, contents.to_json)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end

  def create_content_image(content)
    uri = URI.parse(content['content']['src'])

    if uri.query.present?
      params = CGI.parse(uri.query)

      if params['temp_id'].present?
        temp = TemporaryContentImage.find(params['temp_id'].first)
        content_image = ContentImage.create(dashboard_id: id, image: temp.image)

        temp.destroy
        content_image
      end
    end
  end

  def assign_content_image_url(contents, content, base_url, is_grid = false, grid = nil)
    content_image = create_content_image(content)

    if content_image.present?
      if is_grid
        contents.find { |content_block| content_block['id'] == grid['id'] }['content']
                .find { |grid_item| grid_item['id'] == content['id'] }['content']['src'] = content_image.image.url(:cover)
      else
        contents.find { |item| item['id'] == content['id'] }['content']['src'] = content_image.image.url(:cover)
      end
    end

    contents
  end
end
