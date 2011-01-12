class Person < ActiveRecord::Base

  belongs_to :school

  belongs_to :monitor, :class_name => "Person"
  belongs_to :supervisor, :class_name => "Person"

  has_many :monitored, :class_name => "Person", :foreign_key => 'monitor_id'
  has_many :supervised, :class_name => "Person", :foreign_key => 'supervisor_id'

  validates_inclusion_of :level, :in => %w(asistente docente maestro)
  validates_presence_of :level

end
