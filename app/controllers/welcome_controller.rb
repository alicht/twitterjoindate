class WelcomeController < ApplicationController
  
  def search
      
  end

  def search_results
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_consumer_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
    @name = params[:name]
    @full_name = twitter_client.user_search(@name).first.name
    created_at = twitter_client.user_search(@name).first.created_at
    @created_at = created_at    
    @user_id = twitter_client.user_search(@name).first.id
  end

  def error

  end

end
