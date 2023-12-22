class ChangeColumnNameInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :user_photor, :user_photo

  end
end
