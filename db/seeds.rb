# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# root_category = Category.create(title: 'Information Technology', icon: 'settings', published: true, tag: 0)
# for i in 1..5
#   category = Category.create(title: "title #{i}", parent_id: root_category.id, icon: 'settings', published:true, tag: i)
#   for j in 1..5
#     index_product = i*10 + j
#     Product.create(name: "product #{index_product}", price: index_product*1000, category_id: category.id, content: "This is content of product #{index_product}")
#   end 
# end

AdminUser.create!(email: 'admin@shop.com', password: '123456', password_confirmation: '123456') if Rails.env.development?