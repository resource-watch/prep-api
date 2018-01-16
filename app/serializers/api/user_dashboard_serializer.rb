# == Schema Information
#
# Table name: user_dashboards
#
#  id                 :integer          not null, primary key
#  name               :string
#  slug               :string
#  description        :string
#  content            :text
#  published          :boolean
#  summary            :text
#  private            :boolean
#  user_id            :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Api::UserDashboardSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :summary, :description, :content, :published,
             :photo, :user_id, :private

  def photo
    {
        thumb: object.photo.url(:thumb),
        original: object.photo.url(:original)
    }
  end
end
