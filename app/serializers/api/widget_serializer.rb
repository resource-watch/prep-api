class Api::WidgetSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :slug, :content, :attribution, :data_url, :widget_config

  def widget_config
     JSON.parse (object.widget_config)
  end

  belongs_to :partner, serializer: Api::PartnerSerializer
end
