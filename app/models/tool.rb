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
#

class Tool < ApplicationRecord

  belongs_to :partner

  def self.published(is_published = true)
    self.where(published: is_published)
  end

end
