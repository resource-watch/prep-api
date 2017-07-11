class Api::IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :content, :published

  has_many :widgets
end
