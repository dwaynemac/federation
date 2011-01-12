require 'machinist/active_record'
require 'sham'

Uname.blueprint do
  name { Faker::Internet.domain_name }
end

Federation.blueprint do
  name { Faker::Name.first_name }
end

Person.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  level { "asistente" }
end