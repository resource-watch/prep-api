# == Schema Information
#
# Table name: tools
#
#  id          :integer          not null, primary key
#  title       :string
#  summary     :text
#  url         :string
#  attribution :string
#  published   :boolean          default(FALSE)
#  partner_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tool < ApplicationRecord

  belongs_to :partner, optional: :true

  def self.published(is_published = true)
    self.where(published: is_published)
  end

end
