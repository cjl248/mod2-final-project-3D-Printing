class Organ < ApplicationRecord
  has_many :requirements, dependent: :destroy
  has_many :user_organs, dependent: :destroy
  has_many :components, through: :requirements
end
