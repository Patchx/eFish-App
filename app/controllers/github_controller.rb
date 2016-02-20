class GithubController < ApplicationController
  def index
    @profile = HTTParty.get("https://api.github.com/users/Patchx").parsed_response
  end
end