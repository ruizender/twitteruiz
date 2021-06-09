json.extract! tweet, :id, :textweet, :retweet, :tweet_photo, :user_id, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
