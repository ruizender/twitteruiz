class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :textweet
      t.integer :retweet, default: 0
      t.string :tweet_photo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
