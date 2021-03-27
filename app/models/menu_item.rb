class MenuItem < ApplicationRecord
  validates :name , presence: true
  validates :description ,presence: true
  validates :price , presence: true
  validates :production_cost ,presence: true
  belongs_to :category

  def self.updateFrequency(id)
    arr = []
    OrderItem.where(invoice_id :id).map do |item|
      item = MenuItem.find(item.menu_item_id)
      item.ordering_frequency = item.ordering_frequency + 1
      item.save
      arr.push(item)
    end

    arr
  end
end
