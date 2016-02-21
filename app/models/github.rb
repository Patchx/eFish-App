class Github
	def self.get_profile(user)
		HTTParty.get("https://api.github.com/users/#{user}").parsed_response
	end
end
