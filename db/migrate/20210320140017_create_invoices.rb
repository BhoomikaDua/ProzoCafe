class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.bigint :invoice_id
      t.boolean :online_order
      t.bigint :user_id
      t.boolean :delivered
      t.bigint :total_bill
      t.bigint :production_cost

      t.timestamps
    end
  end
end
