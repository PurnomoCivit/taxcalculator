class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
		    t.string :name, limit: 150
      	t.integer :tax_code, null: true
      	t.integer :amount, null: true
      	t.float :tax_amount, null: true
      	t.float :total_amount, null: true
      	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
