class UserOrgan < ApplicationRecord
  belongs_to :user
  belongs_to :organ
  # has_many :components, through: :organ

  def check_minimum(checked_ids)
    min = self.organ.minimum_component_count
    if checked_ids.count < min
      return "You must select at least #{min} components"
    else
      return nil
    end
  end

  def compare_ids(checked_ids)
    required_ids = self.organ.components.map {|component| component.id}
    required_ids.each do |id|
      if !checked_ids.include?(id.to_s)
        return Component.find(id).missing_error
      end
    end
    return nil
  end

end
