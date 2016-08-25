# == Schema Information
#
# Table name: widgets
#
#  id             :integer          not null, primary key
#  title          :string
#  summary        :string
#  slug           :string
#  data_url       :string
#  content        :text
#  widget_config  :text
#  published      :boolean          default(FALSE)
#  partner_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dataset        :string
#  visualization  :string
#  widget_type_id :integer
#  attribution    :string
#

class Widget < ApplicationRecord

  belongs_to :partner
  belongs_to :widget_type
  
end
