class Api::ToolSerializer < ActiveModel::Serializer

  attributes :id, :title, :summary, :url, :attribution
  
end
