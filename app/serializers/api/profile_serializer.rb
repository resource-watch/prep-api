class Api::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :avatar

  def avatar
    {
        thumb: object.avatar.url(:thumb),
        medium: object.avatar.url(:medium),
        original: object.avatar.url(:original)
    }
  end
end
