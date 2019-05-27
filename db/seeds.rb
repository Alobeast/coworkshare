# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Request.destroy_all

killian = Request.create!(first_name:'Killian', last_name:'1', email:'killian.com', phone_number:'1655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
bob = Request.create!(first_name:'bob', last_name:'2', email:'killian.', phone_number:'2655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
med = Request.create!(first_name:'med', last_name:'3', email:'med.', phone_number:'3655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
rob = Request.create!(first_name:'rob', last_name:'4', email:'rob.', phone_number:'4655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
ben = Request.create!(first_name:'ben', last_name:'5', email:'ben.', phone_number:'5655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
kat = Request.create!(first_name:'kat', last_name:'6', email:'kat.', phone_number:'6655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
sam = Request.create!(first_name:'sam', last_name:'7', email:'sam.', phone_number:'7655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
john = Request.create!(first_name:'john', last_name:'8', email:'john.', phone_number:'8655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
alois = Request.create!(first_name:'alois', last_name:'Beard', email:'alois.beard@gmail.com', phone_number:'0655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
kim = Request.create!(first_name:'kim', last_name:'9', email:'kim.', phone_number:'9655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
seb = Request.create!(first_name:'seb', last_name:'10', email:'seb.', phone_number:'11655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
fred = Request.create!(first_name:'fred', last_name:'11', email:'fred.', phone_number:'10655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
grut = Request.create!(first_name:'grut', last_name:'12', email:'grut.', phone_number:'12655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
