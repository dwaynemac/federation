class Person < ActiveRecord::Base

  has_one :uname, :as => :named

  belongs_to :school

  belongs_to :monitor, :class_name => "Person"      #current monitor
  belongs_to :supervisor, :class_name => "Person"   #current supervisor
  belongs_to :federation                            #current federation

  has_many :monitored, :class_name => "Person", :foreign_key => 'monitor_id'
  has_many :supervised, :class_name => "Person", :foreign_key => 'supervisor_id'

  has_many :observations, :foreign_key => "observed_id"
  has_many :observations_it_made, :class_name => "Observation", :foreign_key => "observer_id"

  validates_inclusion_of :level, :in => %w(asistente docente maestro)
  validates_presence_of :level

  def full_name(options={})
    if options[:invert]
      "#{self.last_name}, #{self.first_name}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end
end
