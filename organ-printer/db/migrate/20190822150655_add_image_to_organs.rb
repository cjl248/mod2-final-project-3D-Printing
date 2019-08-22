class AddImageToOrgans < ActiveRecord::Migration[5.2]
  def change
    add_column :organs, :image, :string
  end
end
