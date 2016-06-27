class Partner < ApplicationRecord

  has_attached_file :logo, styles: { medium: "200x200>", thumb: "75x75>" }

end
