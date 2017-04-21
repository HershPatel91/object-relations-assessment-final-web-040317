class Rating
  attr_accessor :score, :movie, :viewer

  ALL = []

  def initialize(score, movie, viewer)
  	@score=score
  	@movie = movie
  	@viewer = viewer
  	ALL << self
  end

  def self.all
  	ALL
  end
  
end
