module Api
  module V1
    class NewsController < V1Controller
      def news
        tweets_groups = Tweet.order("created_at DESC")
        i = 0
        array = []
        tweets_groups.each do |tweet|
          if i < 50
            array.push ({
              id: tweet.id,
              content: tweet.textweet,
              user_id: tweet.user_id,
              like_count: tweet.likes.count,
              retweets_count: tweet.retweet,
              rewtitted_from: tweet.ref_id_tweet,
              created_at: tweet.created_at
            })
            i += 1
          end
        end
        render json: array
      end

      def limit
        tweets_groups = Tweet.order("created_at DESC")
        fecha1 = params[:fecha1]
        fecha2 = params[:fecha2]
        array = []
        tweets_groups.each do |tweet|
          if ((fecha1 < tweet.created_at.strftime("%Y-%m-%d"))&&(fecha2 > tweet.created_at.strftime("%Y-%m-%d")) )
              array.push ({
                id: tweet.id,
                content: tweet.textweet,
                user_id: tweet.user_id,
                like_count: tweet.likes.count,
                retweets_count: tweet.retweet,
                rewtitted_from: tweet.ref_id_tweet,
                created_at: tweet.created_at
              })
          end
        end
        render json: array
      end
    end
  end
end