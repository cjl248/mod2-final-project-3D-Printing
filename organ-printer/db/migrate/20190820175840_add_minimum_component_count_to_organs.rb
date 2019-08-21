class AddMinimumComponentCountToOrgans < ActiveRecord::Migration[5.2]
  def change
    add_column :organs, :minimum_component_count, :integer
  end
end
