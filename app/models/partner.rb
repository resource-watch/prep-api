class Partner < ApplicationRecord

  before_save :extract_dimensions

  has_attached_file :logo, styles: { medium: "200x200>", thumb: "75x75>" }
  has_attached_file :white_logo, styles: { medium: "200x200>", thumb: "75x75>" }

  validates_attachment_content_type :logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :white_logo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private

  # Retrieves dimensions for image logo
  def extract_dimensions
    tempfile = logo.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.logo_dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
    end
  end

end
