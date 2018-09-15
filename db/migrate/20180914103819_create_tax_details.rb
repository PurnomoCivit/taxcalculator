class CreateTaxDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_details do |t|
      t.integer :total_amount
      t.float :total_tax_amount
      t.float :grand_total
	  t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
