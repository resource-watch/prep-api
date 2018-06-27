class Api::CoreDatasetSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :country_iso,
             :subcategory, :dataset_ids, :tags,
             :published, :staging, :preproduction, :production
end
