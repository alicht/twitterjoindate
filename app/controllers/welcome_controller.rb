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
    begin
      user = twitter_client.user(@name)
    rescue 
      render template: "welcome/error"
    end

    if user
     @full_name = user.name
     @created_at = user.created_at    
     @user_id = user.id
     response = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=new+york+times&sort=oldest&q=&begin_date=#{@created_at}&end_date=#{@created_at}&api-key=5dc6806f7b4ce918bdc37bc975fb783a:10:69926712")
     @nytimes_headlines = response["docs"][0]["headline"]


    end



    # http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=romney&facet_field=day_of_week&begin_date=20120101&end_date=20120101&api-key5dc6806f7b4ce918bdc37bc975fb783a:10:69926712

  end

  

  def error

  end

end
