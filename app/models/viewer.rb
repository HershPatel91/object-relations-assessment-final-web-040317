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

hersh = Viewer.new("Hersh", "Patel")
hersh.create_rating(10, "Avatar")
mike = Viewer.new("Mike", "Smith")
mike.create_rating(5, "Avatar")

