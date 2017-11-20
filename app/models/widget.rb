# == Schema Information
#
# Table name: widgets
#
#  id             :integer          not null, primary key
#  title          :string
#  summary        :string
#  slug           :string
#  data_url       :string
#  content        :text
#  widget_config  :text
#  published      :boolean          default(FALSE)
#  partner_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dataset        :string
#  visualization  :string
#  widget_type_id :integer
#  attribution    :string
#

class Widget < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :partner
  belongs_to :widget_type

  private

  def self.published(is_published = true)
    self.where(published: is_published)
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
