class School < ActiveRecord::Base

  has_one :uname, :as => :named

  belongs_to :federation
  belongs_to :filiation_category

  validates_presence_of :name


  belongs_to :director, :class_name => "Person"
  has_many :team_members, :class_name => "Person"
end