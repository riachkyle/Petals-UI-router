class RemovePictureFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :picture, :string
  end
end
