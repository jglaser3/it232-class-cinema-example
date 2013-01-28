class Review < ActiveRecord::Base
  attr_accessible :content, :movie_id, :rating
  
  belongs_to :movie
end
