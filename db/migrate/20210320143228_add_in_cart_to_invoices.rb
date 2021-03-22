class AddInCartToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :in_cart, :boolean
  end
end
