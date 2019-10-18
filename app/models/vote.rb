class Vote < ApplicationRecord
belongs_to :course, polymorphic: true
    
def self.create_like(course, current_user)
@like = Vote.find_or_initialize_by(:course=>course,:user_id=>current_user.id)
if @like.like
@like.destroy
else
@like.like= true
@like.save
end
end    
    
    
 def self.create_dislike(course, current_user)
 @like = Vote.find_or_initialize_by(:course=>course,:user_id=>current_user.id)
 if @like.like==false
 @like.destroy
 else
 @like.like= false
 @like.save
 end
 end
    
    
 def self.reset(course)
 Vote.where(:course => course).destroy_all
 end
 
end
