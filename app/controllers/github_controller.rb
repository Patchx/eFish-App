class GithubController < ApplicationController
  def index
    @profile = Github.get_profile('eddroid')
  end
end