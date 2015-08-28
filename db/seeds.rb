1.times do
  @user = User.create(fullname: Faker::Name.name, email: Faker::Internet.email, password: "password")
  @property = Property.create(property_name: Faker::Address.street_name, description: Faker::Company.catch_phrase, price: "100")
  @tag = Tag.create(tag: Faker::Hacker.noun)

  @property.tags << @tag

end
