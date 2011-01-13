class Observation < ActiveRecord::Base
  belongs_to :observer, :class_name => "Person"
  belongs_to :observed, :class_name => "Person"

  validates_presence_of :observer, :observed, :observed_on, :observation
end
