# == Schema Information
#
# Table name: tools
#
#  id            :integer          not null, primary key
#  title         :string
#  summary       :text
#  url           :string
#  attribution   :string
#  published     :boolean          default(FALSE)
#  partner_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  production    :boolean          default(TRUE)
#  preproduction :boolean          default(FALSE)
#  staging       :boolean          default(FALSE)
#

class Tool < ApplicationRecord

  belongs_to :partner, optional: :true

  scope :production, -> { where(production: true) }
  scope :preproduction, -> { where(preproduction: true) }
  scope :staging, -> { where(staging: true) }
  
  def self.published(is_published = true)
    self.where(published: is_published)
  end

end
