class CreateRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :requirements do |t|
      t.belongs_to :organ, foreign_key: true
      t.belongs_to :component, foreign_key: true

      t.timestamps
    end
  end
end
