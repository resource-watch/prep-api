# == Schema Information
#
# Table name: indicators
#
#  id      :integer          not null, primary key
#  title   :string
#  summary :text
#  content :text
#

class Indicator < ApplicationRecord

  has_and_belongs_to_many :widgets
  accepts_nested_attributes_for :widgets, allow_destroy: true

end
