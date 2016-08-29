# == Schema Information
#
# Table name: tools
#
#  id          :integer          not null, primary key
#  title       :string
#  summary     :text
#  url         :string
#  attribution :string
#

class Tool < ApplicationRecord

  def self.published
    self.where(published: true)
  end

end
