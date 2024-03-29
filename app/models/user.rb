class User < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy
  has_one_attached :photo


  validates :nickname, presence: true, length: { maximum: 50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
