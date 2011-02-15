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

User.blueprint do
  username { Faker::Internet.user_name }
  federation { Federation.make }
end

Observation.blueprint do
  observer { User.make }
  observed { Person.make(:federation => self.oberver.federation) }
  observation { Faker::Lorem.paragraph }
  observed_on { Time.zone.now }
end