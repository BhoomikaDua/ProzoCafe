class InvoicesController < ApplicationController
  belongs_to: user

  def index
    render "index"
  end

  def cart
    render "cart"
  end
end
