class Category < ApplicationRecord
  validates :name , presence: true
  has_many  :menuitems

  def self.createCategory(name, is_active)
    new_category = Category.new(
      name: name,
      is_active: is_active
    )
    new_category
  end

  def self.toggleActiveStatus(id, is_active)
    category = Category.find(id)
    category.is_active = !!is_active
    category.save
  end

  def self.categoryArray
    categoryChoices=Array.new;
    Category.all.map{ |category|
      puts category.name
      puts category.id
      categoryOption=[category.name.to_s, category.id.to_s];
      categoryChoices.push(categoryOption)
    }
    categoryChoices
  end
end
