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
end
