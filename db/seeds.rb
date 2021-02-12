# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'user_one')
u2 = User.create(name: 'user_two')
u3 = User.create(name: 'user_three')
u4 = User.create(name: 'user_four')

@linux = Category.find_by(name: 'Linux')
@windows = Category.find_by(name: 'Windows')
@web = Category.find_by(name: 'Web')
@mac = Category.find_by(name: 'Mac')
@misc = Category.find_by(name: 'Misc')


a1 = Article.create(title: 'Microsoft plans big Windows 10 UI refresh', author: u1)
# a2 = Article.create(title: 'Article Two', category: c1)
