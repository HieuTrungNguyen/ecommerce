User.create! name: "Hieu Trung Nguyen",
             email: "nguyentrunghieu3103@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             phone: "0986140014",
             address: "Gia Loc",
             city: "Hai Duong",
             country: "Viet Nam",
             role: 1,
             admin: true
49.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  city = Faker::Address.state
  country = Faker::Address.country
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               phone: phone,
               address: address,
               city: city,
               country: country,
               role: 0
end

50.times do
  Category.create!(
    name: Faker::Name.name
    )
end

50.times do
  category_ids = Category.pluck(:id)
  name = Faker::Company.name
  description = Faker::Lorem.sentence(5)
  image = Faker::Company.logo
  price = Faker::Number.number(2)
  quantity = Faker::Number.between(1, 10)
  Product.create!(
      category_id: category_ids[rand(category_ids.size)],
      name: Faker::Name.name,
      description: description,
      price: price,
      image: image,
      quantity: quantity
    )
end
