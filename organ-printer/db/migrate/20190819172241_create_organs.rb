class CreateOrgans < ActiveRecord::Migration[5.2]
  def change
    create_table :organs do |t|
      t.string :name
      t.timestamps
    end
  end
end
