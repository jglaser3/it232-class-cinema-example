require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "ability to find movie record" do
    m = Movie.find_by_title("Jaws")
    
    assert m.title == "Jaws", "Movie title did not successfully match"
  end
  
  test "movie validation for year" do
    m = Movie.new
    m.title = "Patton"

    m.year = 197
    assert ! m.save, "Did not catch that year is too low"
    
    m.year = 2100
    assert ! m.save
    
    m.year = 1970
    assert m.save
  end
  
  test "Test whether dependents are destroyed" do
    m = Movie.find_by_title("Jaws")
    assert m.reviews.length == 2
    
    deleted_movie_id = m.id
    m.destroy
    assert Review.find_all_by_movie_id(deleted_movie_id).length == 0
    
  end
  
end
