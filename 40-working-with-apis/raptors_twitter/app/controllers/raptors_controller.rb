class RaptorsController < ApplicationController

  def index
    client = Tweet.get_twitter_client
    @tweets = client.search('#raptors').take(10)
  end

end
