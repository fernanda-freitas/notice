class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.text :content
      t.string :todo
      t.references :kit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
