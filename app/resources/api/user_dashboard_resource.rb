module Api
  class UserDashboardResource < JSONAPI::Resource
    caching

    attributes :name, :slug, :description, :content, :published, :summary, :private, :user_id, :photo, :created_at, :updated_at

    filters :name, :slug, :published, :private, :user_id
  end
end
