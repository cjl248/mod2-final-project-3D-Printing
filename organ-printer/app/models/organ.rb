class Organ < ApplicationRecord
  has_many :requirements, dependent: :destroy
  has_many :user_organs, dependent: :destroy
  has_many :components, through: :requirements

  def cost_to_build
    self.components.map {|component| component.price}.sum
  end

  def random_price
    #want it to be between 20% and 400% of the cost o build
    self.cost_to_build * rand(0.1..4.0).round(2)
  end

end
