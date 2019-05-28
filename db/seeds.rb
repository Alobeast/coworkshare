# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Request.destroy_all

killian = Request.create!(first_name:'Killian', last_name:'Buruf', email:'killian.com', phone_number:'1655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
bob = Request.create!(first_name:'Bob', last_name:'Boulou', email:'bob.com', phone_number:'2655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
med = Request.create!(first_name:'Med', last_name:'Chitrak', email:'med.com', phone_number:'3655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
rob = Request.create!(first_name:'Rob', last_name:'Inet', email:'rob.com', phone_number:'4655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "unconfirmed")
ben = Request.create!(first_name:'Ben', last_name:'Mimou', email:'ben.com', phone_number:'5655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
kat = Request.create!(first_name:'Kat', last_name:'Miaou', email:'kat.com', phone_number:'6655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
sam = Request.create!(first_name:'Sam', last_name:'Lipo', email:'sam.com', phone_number:'7655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
john = Request.create!(first_name:'John', last_name:'John', email:'john.com', phone_number:'8655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
# alois = Request.create!(first_name:'alois', last_name:'Beard', email:'alois.beard@gmail.com', phone_number:'0651228283', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
kim = Request.create!(first_name:'Kim', last_name:'Gubur', email:'kim.com', phone_number:'9655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "unconfirmed")
seb = Request.create!(first_name:'Seb', last_name:'Pralu', email:'seb.com', phone_number:'11655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "expired")
fred = Request.create!(first_name:'Fred', last_name:'Weog', email:'fred.com', phone_number:'10655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "confirmed")
grut = Request.create!(first_name:'Grut', last_name:'Gudur', email:'grut.com', phone_number:'12655253514', about: 'blablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablablabla', status: "accepted")
