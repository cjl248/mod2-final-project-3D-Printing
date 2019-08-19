class UserOrgan < ApplicationRecord
  belongs_to :user
  belongs_to :organ
end
