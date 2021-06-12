class RemoveColumnTweetPhotoFromTableTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :tweet_photo, :string
  end
end
