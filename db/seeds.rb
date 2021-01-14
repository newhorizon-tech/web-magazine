# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'User One')
u2 = User.create(name: 'User Two')
u3 = User.create(name: 'User Three')
u4 = User.create(name: 'User Four')

c1 = Category.create(name: 'Web', priority: 4)
c2 = Category.create(name: 'Linux', priority: 3)
c3 = Category.create(name: 'Windows', priority: 2)
c4 = Category.create(name: 'Mac', priority: 1)

# a1 = Article.create(title: 'Article One', author: u1)
# a2 = Article.create(title: 'Article Two', category: c1)
