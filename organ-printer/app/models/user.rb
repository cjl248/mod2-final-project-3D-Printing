class User < ApplicationRecord
  has_many :user_organs
  has_many :organs, through: :user_organs
end
