# Observations made to a person. Represents a kind of follow up.
#
class Observation < ActiveRecord::Base
  belongs_to :observer, :class_name => "User"
  belongs_to :observed, :class_name => "Person"

  validates_presence_of :observer, :observed, :observed_on, :observation
end
