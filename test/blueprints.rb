require 'machinist/active_record'
require 'sham'

Uname.blueprint do
  name { Faker::Internet.domain_name }
end

Federation.blueprint do
  name { Fake::Name.first_name }

end