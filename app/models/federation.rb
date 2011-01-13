class Federation < ActiveRecord::Base

  has_one :uname, :as => :named

  belongs_to :president, :class_name => "Person"
  belongs_to :vice_president, :class_name => "Person"

  has_many :schools
  has_many :people

  validates_presence_of :name
end
