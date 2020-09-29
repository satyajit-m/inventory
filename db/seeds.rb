# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(id: 1, name: "Admin", email: "satyajit.mohapatra2020@gmail.com", admin: true, status: false).save(validate: false)
User.new(id: 2, name: "ABC", email: "abc@gmail.com", admin: false, status: false).save(validate: false)
User.new(id: 3, name: "XYZ", email: "xyz@gmail.com", admin: false, status: false).save(validate: false)
Brand.create(id: 1, name: "Dell")
Brand.create(id: 2, name: "HP")
Brand.create(id: 3, name: "Lenovo")
Category.create(id: 1, name: "Laptop", min_qty: 2, buffer: 5)
Category.create(id: 2, name: "Keyboard", min_qty: 3, buffer: 6)
Category.create(id: 3, name: "Monitor", min_qty: 2, buffer: 5)
Category.create(id: 4, name: "Printer", min_qty: 1, buffer: 3)
Item.create(id: 1, name: "Inspiron 3567", brand_id: 1, category_id: 1)
Item.create(id: 2, name: "HP_Laser_1010", brand_id: 2, category_id: 4)
Item.create(id: 3, name: "Thinkpad X1", brand_id: 3, category_id: 1)