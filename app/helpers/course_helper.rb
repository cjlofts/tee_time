module CourseHelper

  # this basially generates an array of hashes that looks like
  # [{lat: 49.5554, lng: 45.34343, infowindow: "..."},
  #  {lat: 49.5554, lng: 45.34343, infowindow: "..."}]
  def generate_markers(courses)
    Gmaps4rails.build_markers(courses) do |course, marker|
      marker.lat course.latitude
      marker.lng course.longitude
      link = link_to course.name, golf_course_path(course)
      marker.infowindow "<h6>#{link}</h6>"
    end
  end

end
