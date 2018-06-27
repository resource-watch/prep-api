# == Schema Information
#
# Table name: core_datasets
#
#  id          :integer          not null, primary key
#  title       :string
#  slug        :string
#  country_iso :string
#  subcategory :string
#  dataset_ids :text             default([]), is an Array
#  tags        :text             default([]), is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CoreDataset < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  enum subcategories: ['Temperature', 'Precipitations', 'Extreme events',
                       'Coastal risk', 'Water risk', 'People', 'Agriculture',
                       'Infrastructure', 'Socioeconomic', 'Indices of vulnerability',
                       'Administrative Boundaries', 'Land', 'Water']

  validates :subcategory, inclusion: { in: CoreDataset.subcategories }

  scope :production, -> { where(production: true) }
  scope :preproduction, -> { where(preproduction: true) }
  scope :staging, -> { where(staging: true) }

  def should_generate_new_friendly_id?
    title_changed?
  end
end
