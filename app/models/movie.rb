class Movie

	attr_accessor :title, :year, :rating, :duration

	def initialize(title, year, rating, duration=0)
		@title = title
		@year = year
		@rating = rating
		@duration = duration.to_i
	end

end