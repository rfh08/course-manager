class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CategoriesHelper
  include LocationsHelper
  include CoursesHelper

  

end