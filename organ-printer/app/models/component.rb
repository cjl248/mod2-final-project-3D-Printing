class Component < ApplicationRecord
  has_many :requirements, dependent: :destroy
end
