class Pet < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true

  has_attached_file :photo,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  # Returns the paperclip photo url
  def photo_url
    photo.url
  end
end
