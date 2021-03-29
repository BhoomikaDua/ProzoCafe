class MenuItem < ApplicationRecord
  validates :name , presence: true
  validates :description ,presence: true
  validates :price , presence: true
  validates :production_cost ,presence: true
  validates :stock ,presence: true
  belongs_to :category

  def self.categoryMenuItems(category_id)
    MenuItem.all.order("id").where("category_id = ?", category_id.to_s)
  end

  def self.createMenuItem(name, description, category_id, price, production_cost, stock)
    new_menu_item = MenuItem.new(
      name: name,
      description: description,
      category_id: category_id,
      price: price,
      ordering_frequency: 0,
      production_cost: production_cost,
      stock: stock
    )
    new_menu_item
  end

  def self.updateMenuItem(id, name, description, category_id, price, production_cost, stock)
    menu_item = MenuItem.update(
      id,
      name: name,
      description: description,
      category_id: category_id,
      price: price,
      ordering_frequency: 0,
      production_cost: production_cost,
      stock: stock
    )
    menu_item
  end
end
