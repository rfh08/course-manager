module ApplicationHelper
   # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
 def count_like(course)
 course.votes.where(like: true).count
 end
 def count_dislike(course)
 course.votes.where(like: false).count
 end
  
  
 
    
  
  
end