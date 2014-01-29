require 'open-uri'

class Api

	def initialize(film)

	api_key = ENV['SECRET_TOKEN']

	# Convert user input into something we can use in the API
	movie = film[0].gsub(/\s/ , "+")

	# Use JSON gem to get data
	@movieAPIdata = JSON.parse(open("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=#{api_key}&q=#{movie}&page_limit=1").read) 

	end
end

