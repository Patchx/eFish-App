class Github
	def get_profile
		HTTParty.get("https://api.github.com/users/#{user}").parsed_response
	end
end
