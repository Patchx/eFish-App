class GithubController < ApplicationController
  def index
    # @profile = Github.get_profile('eddroid')
    @profile = HTTParty.get("https://api.github.com/users/Patchx").parsed_response
  end
end