class CreateKits < ActiveRecord::Migration[6.1]
  def change
    create_table :kits do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
