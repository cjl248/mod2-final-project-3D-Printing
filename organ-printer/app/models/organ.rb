class Organ < ApplicationRecord
  has_many :requirements
  has_many :components, through: :requirements
end
