class RenamePostPhotoToUserPhoto < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :post_photo, :user_photor
  end
end
