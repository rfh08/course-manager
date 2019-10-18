module CoursesHelper

def checklast
@checklast = Course.all.ids.last.nil?
end

def checkexist?
  checklast.nil?
end

def current_course_owner
@course = Course.user
end

def correct_owner
@course = Course.user
end

   # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

end
