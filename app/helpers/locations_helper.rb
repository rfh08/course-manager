module LocationsHelper
  def locations
    @locations = Location.all
  end
end
