# == Schema Information
#
# Table name: insights
#
#  id                 :integer          not null, primary key
#  title              :string
#  slug               :string
#  summary            :text
#  content            :text
#  content_url        :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  published          :boolean          default(FALSE)
#  partner_id         :integer
#  attribution        :string
#

class Insight < ApplicationRecord
  
  has_attached_file :image

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :partner

end
