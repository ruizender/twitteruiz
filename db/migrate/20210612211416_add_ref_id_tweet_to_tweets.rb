class AddRefIdTweetToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :ref_id_tweet, :integer
  end
end
