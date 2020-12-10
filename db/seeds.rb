# erase everything
User.destroy_all
Payment.destroy_all
Server.destroy_all
Domain.destroy_all

# first user
user = User.create(
  name: "Krzysztof Kęczkowski",
  position: "Programista",
  email: "kkeczkowski@icloud.com",
  password: "123qwe!@#QWE",
  password_confirmation: "123qwe!@#QWE"
)
5.times do
  package = Package.all.sample
  payment = Payment.create(
    title: ['Pro Forma', 'Faktura VAT'].sample,
    name: package.name + " " + Faker::Invoice.reference,
    price: package.price,
    user_id: user.id,
    deadline: Faker::Date.between(from: 1.year.ago, to: Date.today + 1.year)
  )
  server = Server.create(
    package_id: package.id,
    user_id: user.id,
    name: Faker::Internet.username(specifier: 5..10),
    disk_space: rand(0..package.disk_space),
    paid_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    paid: [true, false].sample
  )
  3.times do
    domain = Domain.create(
      name: Faker::Internet.domain_name,
      user_id: user.id,
      server_id: server.id
    )
  end
end

# new table rows
10.times do
  user = User.create(
    name: Faker::Name.name_with_middle,
    position: Faker::Job.title,
    email: Faker::Internet.free_email,
    password: "123qwe!@#QWE",
    password_confirmation: "123qwe!@#QWE"
  )
  5.times do
    package = Package.all.sample
    payment = Payment.create(
      title: ['Pro Forma', 'Faktura VAT'].sample,
      name: package.name + " " + Faker::Invoice.reference,
      price: package.price,
      user_id: user.id,
      deadline: Faker::Date.between(from: 1.year.ago, to: Date.today + 1.year)
    )
    server = Server.create(
      package_id: package.id,
      user_id: user.id,
      name: Faker::Internet.username(specifier: 5..10),
      disk_space: rand(0..package.disk_space),
      paid_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      paid: [true, false].sample
    )
    3.times do
      domain = Domain.create(
        name: Faker::Internet.domain_name,
        user_id: user.id,
        server_id: server.id
      )
    end
  end
end
