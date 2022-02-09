class RemoveColumnsFromConnects < ActiveRecord::Migration[6.0]
  def change
    remove_column :connects, :name, :string
    remove_column :connects, :email, :text
  end
end
