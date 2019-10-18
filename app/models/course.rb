class Course < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :course, dependent: :destroy
  has_many :categorizations
  has_many :categories, through: :categorizations, dependent: :destroy
  has_many :localizations
  has_many :locations, through: :localizations, dependent: :destroy
  mount_uploader :image, ImageUploader
 validate  :image_size
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 10 }
  validates :prerequisite, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 30 }

  private

    # Validates the size of an uploaded image.
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end


end
