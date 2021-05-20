# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all

Category.destroy_all

Category.create(name:"Nike", description:"Inspiring the world's athletes, Nike delivers innovative products, experiences ... Nike. Just Do It.")
Category.create(name:"Adidas", description:"Adidas AG is a German multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories. It is the largest sportswear manufacturer in Europe.")
Category.create(name:"Yeezy", description:"Adidas Yeezy is a fashion collaboration between German sportswear company Adidas and American designer, rapper, entrepreneur and personality Kanye.")
Category.create(name:"Air Jordan", description:"Air Jordan (sometimes abbreviated AJ) is an American brand of basketball shoes, athletic, casual, and style clothing produced by Nike.")
Category.create(name:"Converse", description:"Converse is an American shoe company that designs, distributes, and licenses sneakers, skating shoes, lifestyle brand footwear, apparel, and accessories.")
Category.create(name:"New Balance", description:"New Balance (NB) is an American sports footwear and apparel brand that was established in 1906. The brand was originally associated with the New Balance Arch Support Company.")
Category.create(name:"Puma", description:"Puma SE, branded as Puma, is a German multinational corporation that designs and manufactures athletic and casual footwear, apparel and accessories, which is headquartered in Herzogenaurach, Bavaria, Germany.")

