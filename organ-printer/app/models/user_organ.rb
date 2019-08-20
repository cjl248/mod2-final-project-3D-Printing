class UserOrgan < ApplicationRecord
  belongs_to :user
  belongs_to :organ

  def component_ids
  end

  def compare_ids(array_of_ids)
    byebug
    # compare that to array_of_ids
    # self.organ.components_ids
  end

end
