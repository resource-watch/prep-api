# == Schema Information
#
# Table name: indicators
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :text
#  content    :text
#  published  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Indicator < ApplicationRecord

  has_and_belongs_to_many :widgets
  accepts_nested_attributes_for :widgets, allow_destroy: true

end
