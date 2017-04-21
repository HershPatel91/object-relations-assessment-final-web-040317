# Please copy/paste all three classes into this file to submit your solution!
class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	ALL
  end

  def self.find_by_name(name)
  	self.all.find{|x| x.full_name == name}
  end

  def create_rating(score, title)
  	new_movie = Movie.find_or_create_by(title)
  	Rating.new(score, new_movie, self)
  end

end

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

class Movie
  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
  	ALL
  end

  def self.find_by_title(title)
  	self.all.find{|x| x.title == title}
  end

  def self.find_or_create_by(title)
  	if self.all.all? {|x| x.title != title}
  		Movie.new(title)
  	else
  		self.find_by_title(title)
  	end
  end

  def ratings
  	Rating.all.select {|x| x.movie == self}
  end

  def viewers
  	ratings.map {|x| x.viewer}
  end

  def average_rating
  	scores = self.ratings.map{|x| x.score}
  	scores.inject{ |sum, el| sum + el }.to_f / ratings.size
  end

end
