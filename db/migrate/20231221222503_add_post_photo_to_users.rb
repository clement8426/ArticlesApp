class AddPostPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :post_photo, :string
  end
end
