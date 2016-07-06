class Partner < ApplicationRecord

  has_attached_file :logo, styles: { medium: "200x200>", thumb: "75x75>" }

  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
