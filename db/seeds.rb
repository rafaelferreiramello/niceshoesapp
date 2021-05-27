# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ShoeCategory.destroy_all
Category.destroy_all
ShoeOrder.destroy_all
Order.destroy_all
Shoe.destroy_all
Blog.destroy_all
User.destroy_all


categories_list = [
    [ "Low-Top", "Low-tops do not cover the ankle" ],
    [ "Hi-Top", "Hi-tops cover the ankle" ],
    [ "Vintage", "Not less than 20 years old" ],
    [ "New", "Brand new product" ],
    [ "Street", "Urban inspired" ],
    [ "Casual", "Relaxed, occasional, spontaneous and suited for everyday use" ],
    [ "Fashion", "Trendy pieces" ]
  ]
categories_list.each do |name, description|
    Category.create!( name: name, description: description )
end

shoes_list = [
    ["Air Force 107", 0.2e3, "In great condition", 2, "Nike", 8, [Category.find_by(name: "Street")]],
    ["Superstar", 0.1e3, "In good condition", 1, "Adidas", 9, [Category.find_by(name: "Low-Top")]],
    ["Clyde", 0.9e2, "In bad condition", 2, "Puma", 12, [Category.find_by(name: "Vintage")]], 
    ["Yeezy 700", 0.5e3, "In great condition", 4, "Adidas", 10, [Category.find_by(name: "Fashion")]],
    ["574", 0.2e3, "In good condition", 5, "New Balance", 10, [Category.find_by(name: "Casual")]],
    ["Chuck Taylor", 0.1e3, "In great condition", 2, "Nike", 7, [Category.find_by(name: "Hi-Top")]]
]

blogs_list = [
    ["Sustainable Materials Reach the Nike Air Max Plus 3", "Chris Potter", "Over the past few years, sustainable sneaker designs seem to be becoming more common, with most brands looking to lighten their carbon footprint, and improve their sustainability practices. Nike have been one of the industry leaders, pushing boundaries and creating a slew of silhouettes that are under their ‘Move to Zero’ umbrella. And the next to receive a recycled rework is the Air Max Plus 3!"],
    ["The Air Jordan 1 Low Heads into the Crater", "Bill Owen", "The past two years have seen Nike push for a more sustainable future via their ‘Move to Zero’ initiative, and we’ve seen a slew of high profile kicks receive Crater foam makeovers that include Team Swoosh’s Grind rubber. Next up, Jordan Brand are jumping on the recycling train with their Air Jordan 1 Low in a colourway that is reminiscent of the famed ‘Shadow’ and ‘Shadow 2.0’."],
    ["Rest in Power: Legendary Hip Hop Photographer Chi Modu Dies", "Ebonie Carroll", "We are heartbroken by the news of Chi Modu’s untimely passing. Chi was responsible for some of the most enduring sneaker imagery from hip hop’s Golden Age. From Eazy-E flashing his adidas Campus atop his lowrider in Compton to Snoop Dogg lacing the Nike Cortez in South Central LA, Chi’s inimitable lens captured the captivating days of 1990s hip hop."]
]


user = User.create!( email: 'test2@test.com', password: 'password' )
user.add_role(:admin)



shoes_list.each do |name, price, description, stock, brand, size, categories|
    a = Shoe.create!(user_id: user.id, name: name, price: price, description: description, stock: stock, brand: brand, size: size, categories: categories)
end

blogs_list.each do |title, author, post|
    Blog.create!(user_id: user.id, title: title, author: author, post: post )
end

p Category.count
p Shoe.count
p Blog.count
p User.count


