# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Currency.create str_code: '800', code: 800, name: 'EUR'
Currency.create str_code: '840', code: 840, name: 'USD'

Rate.create category: 'category',from_currency_id: 800, to_currency_id: 840, buy: 1.2, sell: 0.8
