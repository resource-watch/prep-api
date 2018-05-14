class Api::DashboardDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :slug, :summary, :image, :content, :related_datasets, :published, :user_id, :production, :preproduction, :staging

  has_one :indicator, serializer: Api::IndicatorSerializer
  has_many :insights do
    object.insights.published
  end
  has_many :dashboards do
    object.dashboards.published
  end
  has_many :tools, serializer: Api::ToolSerializer do
    object.tools.published
  end
  has_one :partner, serializer: Api::PartnerSerializer
end
