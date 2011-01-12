class School < ActiveRecord::Base

  has_one :uname, :as => :named

  belongs_to :federation
  belongs_to :filiation_category

  validates_presence_of :name

  has_one  :director, :class_name => "Person"
  has_many :team_members, :class_name => "Person"
end