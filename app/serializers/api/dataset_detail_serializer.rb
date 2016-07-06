class Api::DatasetDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :slug, :content, :data_url, :json_spec

  belongs_to :partner
  belongs_to :dataset_type
end
