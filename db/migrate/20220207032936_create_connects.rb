class CreateConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :connects do |t|
      t.string :name
      t.text :email
      t.text :content

      t.timestamps
    end
  end
end
