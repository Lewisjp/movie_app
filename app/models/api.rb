require 'open-uri'

class Api

	def initialize(film)

	api_key = ENV['THIRD_PARTY_API_OR_LICENSE_KEY']

	# film = @location.scenes.pluck(:title)
	
	#user_input = "Toy Story 3"

	#film = "Toy+Story+3"

	# Convert user input into something we can use in the API
	film = film[0].gsub(/\s/ , "+")

	# Use JSON gem to get data
	@movieAPIdata = JSON.parse(open("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{api_key}=#{film}&page_limit=1").read) 
	

	end
end