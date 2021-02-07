# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  # include Rails.application.routes.url_helpers
  self.abstract_class = true
  # the cleanest way i could think of to get the names for facilities from the join table
  def get_facilities(location)
    facilities = []
    location.location_facilities.each do |fac|
      facilities << fac.facility.name
    end

    facilities
  end

  

  def get_reviews 
    {
      user: User.find_by_id(self.user_id).username,
      body: self.body,
      rating: self.rating,
      image_url: image_check(self),

    }
  end
  

  # Makes the JSON request easier to work with on the React side this is called on the Location object before transmitting it to extract details relating to the location so instead of say having user come through as an integer it comes through with the string
  
  end
end
