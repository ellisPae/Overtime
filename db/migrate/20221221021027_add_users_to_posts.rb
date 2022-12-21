class AddUsersToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, index: true, foreign_key: true
  end

  # rails g migration add_users_to_posts user:references
end
