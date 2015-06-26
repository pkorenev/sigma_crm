# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create managers

include  ActionView::Helpers::TextHelper

def random_user_info

end

20.times do |i|
  m = Manager.new
  m.email = "manager#{i+1}@mail.com"
  m.password = "manager12345"
  m.password_confirmation = m.password

  m.user_info = UserInfo.new
  m.user_info.first_name = cycle(*%w(Вася Петя Митя Ваня Миша Степа Ира Аня Люся Лариса Оля Вера))
  m.user_info.middle_name = cycle(%w(Петрович Степаныч Афанасьевич Игоревич Александрович Романович Ивановна Михайловна Семеновна Андреевна Игоревна Николаевна))
  m.user_info.last_name = cycle(%w(Белозёров Елисеев Евдокимов Бембеев Ардашев Пестов Беспалова Белова Петухова Прохорова Носова Некрасова))
  m.user_info.phone = "38093#{rand(1000000..9999999)}"
  m.user_info.identification_number = "#{rand(10000000000..99999999999)}"
  m.save

end


100.times do |i|
  c = Client.new
  c.email = "client#{i+1}@mail.com"
  c.password = "client12345"
  c.password_confirmation = c.password

  c.user_info = UserInfo.new
  c.user_info.first_name = cycle(%w(Вася Петя Митя Ваня Миша Степа Ира Аня Люся Лариса Оля Вера))
  c.user_info.middle_name = cycle(%w(Петрович Степаныч Афанасьевич Игоревич Александрович Романович Ивановна Михайловна Семеновна Андреевна Игоревна Николаевна))
  c.user_info.last_name = cycle(%w(Белозёров Елисеев Евдокимов Бембеев Ардашев Пестов Беспалова Белова Петухова Прохорова Носова Некрасова))
  c.user_info.phone = "38093#{rand(1000000..9999999)}"
  c.user_info.identification_number = "#{rand(10000000000..99999999999)}"
  c.save
end

5.times do |i|
  a = Admin.new
  a.email = "admin#{i+1}@mail.com"
  a.password = "admin12345"
  a.password_confirmation = a.password

  a.user_info = UserInfo.new
  a.user_info.first_name = cycle(%w(Вася Петя Митя Ваня Миша Степа Ира Аня Люся Лариса Оля Вера))
  a.user_info.middle_name = cycle(%w(Петрович Степаныч Афанасьевич Игоревич Александрович Романович Ивановна Михайловна Семеновна Андреевна Игоревна Николаевна))
  a.user_info.last_name = cycle(%w(Белозёров Елисеев Евдокимов Бембеев Ардашев Пестов Беспалова Белова Петухова Прохорова Носова Некрасова))
  a.user_info.phone = "38093#{rand(1000000..9999999)}"
  a.user_info.identification_number = "#{rand(10000000000..99999999999)}"
  a.save
end

10.times do |ci|

  complex = BuildingComplex.new

  20.times do |i|
    ah = ApartmentHouse.new
    ah.address = Address.new
    ah.address.city = cycle(%w(Львів Київ Донецьк Рівне Волинь Париж Мілан Лондон Берлін Варшава))
    ah.address.country = cycle(%w(Україна Україна Україна Україна Україна Франція Італія Англія Німеччина Польща))
    ah.address.index = rand(11000..99000)
    ah.address.street = cycle(%w(Снопківська Стрийська Львівська Тернопільська Енергетична Карбишева Ярославенка Гвардійська Грецька Болгарська Остроградських))
    ah.address.house_number = rand(1..50)

    [16,24,32,48,64,128].sample.times do |ai|
      a = Apartment.new
      a.address = Address.new
      a.address.apartment_number = rand(1..128)
      a.apartment_info = ApartmentInfo.new


      ApartmentInfo.descriptive_attribute_names.each do |attr_name|
        a.apartment_info.send("#{attr_name}=", Faker::Lorem.sentences(1..3))
      end
      ah.children << a
    end

    complex.children << ah
  end

  10.times do |i|
    p = Penthouse.new
    p.address = Address.new
    p.address.house_number = rand(1..100)

    p.apartment_info = ApartmentInfo.new

    ApartmentInfo.descriptive_attribute_names.each do |attr_name|
      p.apartment_info.send("#{attr_name}=", Faker::Lorem.sentences(1..3))
    end

    complex.children << p
  end

  complex.save

end