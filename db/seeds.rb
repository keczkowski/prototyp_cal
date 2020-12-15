# erase everything
User.destroy_all
Payment.destroy_all
Server.destroy_all
Domain.destroy_all
Package.destroy_all
AdditionalService.destroy_all

# packages
Package.create(name: "Ace", disk_space: 20, price: 99, body: "")
Package.create(name: "Ace Extra", disk_space: 40, price: 149, body: "")
Package.create(name: "Ace Pro", disk_space: 100, price: 399, body: "")
Package.create(name: "Ace Turbo", disk_space: 250, price: 899, body: "")

AdditionalService.create(name: "Zamów certyfikaty SSL", body: "Bezpieczeństwo i wiarygodność to niezwykle ważne elementy dzisiejszego Internetu. Certyfikat SSL pozwoli Tobie i Twoim klientom zachować pełną ochronę podczas procesu przepływu informacji pomiędzy użytkownikiem, a serwerem. Strony zabezpieczone certyfikatem rozpoznasz po znajdującej się w pasku adresu kłódce, protokole https:// w przeglądarce internetowej.")
AdditionalService.create(name: "Oprogramowanie wirusowe G Data", body: "G Data rekordowo szybko reaguje na nowe zagrożenia, gwarantując najwyższy poziom ochrony podczas przeglądania stron WWW. Rozpoznaje i blokuje wirusy, rootkity, robaki, spyware, trojany i backdoory. Możesz bezpoecznie wykonywać czynności związane z bankowością internetową. Zabeczpiecz komputer niebezpiecznymi programami, hakerami i spamem.")
AdditionalService.create(name: "Zestaw 150 mocnych linków SEO", body: "Podstawę strategii umiejętnego linkowania stanowi dziś przede wszystkim jego dywersyfikacja. Dotyczy to zarówno pochodzenia źródła odnośników, sposobów ich zdobywania, jak i rodzajów umieszczanych linków. Dlatego też oferujemy Ci skuteczny zestaw!")



# first user
user = User.create(
  name: "Użytkownik Testowy",
  position: "Tester",
  email: "kkeczkowski@icloud.com",
  password: "123qwe!@#QWE",
  password_confirmation: "123qwe!@#QWE",
  confirmed_at: Time.now
)
package = Package.all.sample
payment = Payment.create(
  title: ['Pro Forma', 'Faktura VAT'].sample,
  name: package.name + " " + Faker::Invoice.reference,
  price: package.price,
  user_id: user.id,
  deadline: Faker::Date.between(from: 1.year.ago, to: Date.today + 1.year)
)
4.times do
  server = Server.create(
    package_id: package.id,
    user_id: user.id,
    name: Faker::Internet.username(specifier: 5..10),
    disk_space: rand(0..package.disk_space),
    paid_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    paid: [true, false].sample
  )
  u_ftp = UFtp.create(
    name: Faker::Internet.username(specifier: 5..10),
    password: 'password',
    home: '/home',
    server_id: server.id
  )
  3.times do
    u_db = UDb.create(
      name: Faker::Internet.username(specifier: 5..10),
      username: Faker::Internet.username(specifier: 5..10),
      password: 'password',
      server_id: server.id
    )
  end
  3.times do
    domain = Domain.create(
      name: Faker::Internet.domain_name,
      user_id: user.id,
      server_id: server.id
    )
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: domain.name, ttl: 14400, value: '127.0.0.1')
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: 'ftp', ttl: 14400, value: '127.0.0.1')
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: 'mail', ttl: 14400, value: '127.0.0.1')
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: 'pop', ttl: 14400, value: '127.0.0.1')
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: 'smtp', ttl: 14400, value: '127.0.0.1')
    DnsRecord.create(domain_id: domain.id, dtype: "A", name: 'www', ttl: 14400, value: '127.0.0.1')
    3.times do
      u_email = UEmail.create(
        name: Faker::Internet.email(domain: domain.name),
        password: 'password',
        disk_space: rand(0..package.disk_space/2),
        server_id: server.id
      )
    end
  end
end
