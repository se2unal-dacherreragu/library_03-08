class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :code
      t.boolean :avaliable
      t.integer :year

      t.timestamps
    end
  end
end
