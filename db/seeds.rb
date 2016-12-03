# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# customer = Customer.create({name: 'John Doe', twitter_id: '00000000', twitter_handle: 'JohnDoe'})
# Account.create({number: "54847693071", customer: customer, balance: 1100.00})
#
# customer = Customer.create({name: 'Jane Doe', twitter_id: '00000001', twitter_handle: 'JaneDoe'})
# user = User.create({  name: 'naveen', email:"dfdf@dfdf.com", account_number:"000000101", password: 'foobar12'})
#
#  Account.create({number: "22343488", user: user, balance: 1100.00})

user = User.create({  name: 'kuldeep', email:"kd@gmail.com", account_number:"000000101", password: 'foobar12'})

 Account.create({number: "1001100", user: user, balance: 1200.00})
