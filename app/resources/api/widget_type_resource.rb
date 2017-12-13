module Api
  class WidgetTypeResource < JSONAPI::Resource
    caching

    attributes :name
  end
end
