class Widget < ApplicationRecord

  belongs_to :partner

  attr_accessor :dataset

end
