class Indicator < ApplicationRecord

  has_and_belongs_to_many :widget
  accepts_nested_attributes_for :widget, allow_destroy: true

end
