class AddTitleToConnects < ActiveRecord::Migration[6.0]
  def change
    add_column :connects, :imagetext, :string
  end
end
