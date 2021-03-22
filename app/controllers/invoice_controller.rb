class InvoiceController < ApplicationController
  def index
    render "index"
  end

  def cart
    render "cart"
  end
end
