class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 150
      t.string :email, limit: 50
      t.string :hp, limit: 20

      t.timestamps
    end
  end
end
