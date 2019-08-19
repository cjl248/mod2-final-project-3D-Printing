class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.string :name
      t.float :price
      t.string :missing_error

      t.timestamps
    end
  end
end
