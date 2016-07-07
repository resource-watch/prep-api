class Api::IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :content

  has_many :widgets
end
