class User < ApplicationRecord
  has_many :courses,:dependent => :destroy

   before_save { email.downcase! }
   validates :name, presence: true, length: { minimum: 4 }
   VALID_EMAIL_REGEX = /\A[a-zA-Z]+[.][a-zA-Z]+[@][Rr][Mm][Ii][Tt][.][Ee][Dd][Uu][.][Aa][Uu]\z/i
   validates :email, presence: true, length: { minimum: 4 },
   format: { with: VALID_EMAIL_REGEX },
   uniqueness: { case_sensitive: false }
   has_secure_password
   VALID_PASSWORD_REGEX = /\A^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,20}\z/
   validates :password, presence: true, length: { minimum: 8 }, allow_nil: true, format: { with: VALID_PASSWORD_REGEX }
   
     # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def is_liked(course)
  if Vote.where(:course => course ,:user_id => self.id).present?
  Vote.where(:course => course ,:user_id => self.id).last.like==true
  end
  end
  
  
  def is_disliked(course)
  if Vote.where(:course => course ,:user_id => self.id).present?
  Vote.where(:course => course ,:user_id => self.id).last.like==false
  end
  end
 
  
 def self.find_course(id, type)
 course = type.constantize.find(id)
 return course
 end
 
     

  
end
