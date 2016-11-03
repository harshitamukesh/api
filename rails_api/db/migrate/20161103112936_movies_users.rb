class MoviesUsers < ActiveRecord::Migration
  def change
  	   create_table :movies_users do |t|
        t.integer :user_id
        t.integer :movie_id
         t.timestamps null: false
     end
  end
end
