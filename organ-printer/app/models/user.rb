class User < ApplicationRecord
  has_many :user_organs, dependent: :destroy
  has_many :organs, through: :user_organs
end
