class Person < ActiveRecord::Base

  has_one :uname, :as => :named

  # current school he works on
  belongs_to :school

  # current monitor
  belongs_to :monitor, :class_name => "Person", :counter_cache => :monitored_counter

  # current supervisor
  belongs_to :supervisor, :class_name => "Person", :conditions => { :level => 'maestro' }

  # current federation
  belongs_to :federation

  has_many :monitored, :class_name => "Person", :foreign_key => 'monitor_id', :dependent => :nullify
  has_many :supervised, :class_name => "Person", :foreign_key => 'supervisor_id', :dependent => :nullify

  # observations made to this person
  has_many :observations, :foreign_key => "observed_id", :dependent => :destroy

  LEVELS = %w(asistente docente maestro)
  validates_inclusion_of :level, :in => LEVELS
  validates_presence_of :level

  scope :full_name_like, lambda{ |string| {:conditions => {:first_name => string}} }

  # Person full name
  #
  # @param [Hash] :invert - will return "last_name, first_name"
  # @return [String] concatenated first and last name
  def full_name(options={})
    if options[:invert]
      "#{self.last_name}, #{self.first_name}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

end
