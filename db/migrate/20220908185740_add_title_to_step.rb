class AddTitleToStep < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :title, :string
  end
end
