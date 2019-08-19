class CreateUserOrgans < ActiveRecord::Migration[5.2]
  def change
    create_table :user_organs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :organ, foreign_key: true

      t.timestamps
    end
  end
end
