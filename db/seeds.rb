# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'User One')
u1 = User.create(name: 'User Two')
c1 = Category.create(name: 'Category One')
a1 = Article.create(title: 'Article One', category: c1)
a2 = Article.create(title: 'Article One', category: c1)
