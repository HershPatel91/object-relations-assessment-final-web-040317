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


