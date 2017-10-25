# == Schema Information
#
# Table name: indicators
#
#  id        :integer          not null, primary key
#  title     :string
#  summary   :text
#  content   :text
#  published :boolean          default(FALSE)
#

class Indicator < ApplicationRecord

  has_and_belongs_to_many :widgets
  accepts_nested_attributes_for :widgets, allow_destroy: true

  def self.published(is_published = true)
    self.where(published: is_published)
  end

end
