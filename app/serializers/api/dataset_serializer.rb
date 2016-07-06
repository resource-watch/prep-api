class Api::DatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :slug, :content

  belongs_to :partner
  belongs_to :dataset_type
end
