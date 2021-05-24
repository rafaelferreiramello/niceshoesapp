# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ShoeCategory.destroy_all
Category.destroy_all

Category.create(name:"Low-Top", description:"Low-tops do not cover the ankle")
Category.create(name:"Hi-Top", description:"Hi-tops cover the ankle")
Category.create(name:"Vintage", description:"Not less than 20 years old")
Category.create(name:"New", description:"Brand new product")
Category.create(name:"Street", description:"Urban inspired")
Category.create(name:"Casual", description:"Relaxed, occasional, spontaneous and suited for everyday use")
Category.create(name:"Fashion", description:"Trendy pieces")


