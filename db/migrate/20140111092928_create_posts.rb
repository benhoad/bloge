class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.string :url

      t.timestamps
    end

    add_index :posts, :url

  end
end
