module CategoriesHelper
  # place it above the name of show.html.erb when working
    # <%= gravatar_for @category %>
    
    # Returns the Gravatar for the given category.
#   def gravatar_for(category)
#     gravatar_id = Digest::MD5::hexdigest(category.email.downcase)
#     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
#     image_tag(gravatar_url, alt: category.name, class: "gravatar")
#   end


    def categories
    @categories = Category.all
    end


end
