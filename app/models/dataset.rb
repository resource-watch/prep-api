class Dataset < ApplicationRecord

  belongs_to :partner
  belongs_to :dataset_type

  accepts_nested_attributes_for :dataset_type

end
