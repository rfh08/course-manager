class Category < ApplicationRecord
   validates :name,  presence: true, length: { maximum: 30 },uniqueness: { case_sensitive: false }
   has_many :categorizations
   has_many :courses, through: :categorizations, dependent: :destroy
end