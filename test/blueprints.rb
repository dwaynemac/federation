require 'machinist/active_record'
require 'sham'

Sham.define do
  name { Faker::Internet.domain_name }
end

Uname.blueprint do
  name
end

Federation.blueprint do
  name
end

School.blueprint do
  name
end

Person.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  level { "asistente" }
end