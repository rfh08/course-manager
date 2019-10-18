class Location < ApplicationRecord
    VALID_LOCATION_REGEX =/([0-9][0-9][0-9])[.]([0-9][0-9][0-9])[.]([0-9][0-9][0-9])/
      validates :location,  presence: true, length: { maximum: 11 },format: { with: VALID_LOCATION_REGEX } ,uniqueness: { case_sensitive: false }
   has_many :localizations
   has_many :courses, through: :localizations, dependent: :destroy
end
