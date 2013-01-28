require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "adding a genre to a movie" do
    m = Movie.find_by_title("Up")
    g = Genre.find_by_name("Comedy")
    
    m.genres << g
    
    assert m.genres.length > 0
  end
end
