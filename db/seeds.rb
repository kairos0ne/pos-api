# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.create(name: 'bugs', email: 'bugs@rubyplus.com', password: '123456')
User.create(name: 'daffy', email: 'daffy@rubyplus.com', password: '123456')

# Start category seeds

Category.destroy_all
category = Category.create({
    name: 'Main Meals',
    description: 'Contains all main meals'
})
category.inventory.create(name: "Steak egg and chips", description: "2 eggs steak and chips")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")

category.save

category = Category.create({
    name: 'Stater Meals',
    description: 'Contains all starter meals'
})
category.inventory.create(name: "Eggs benadict", description: "Poached egg with holindays sauce")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")

category.save

category = Category.create({
    name: 'Kids Meals',
    description: 'Contains all kids meals'
})
category.inventory.create(name: "Hot Dog", description: "Kids hot dog")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")

category.save

category = Category.create({
    name: 'Beers',
    description: 'All beers on sale'
})
category.inventory.create(name: "Hogs Back Hog", description: "Fruity ale from Somerset")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")
category.inventory.create(name: "Another meal for testing", description: "Just another meal")

category.save