class Uname < ActiveRecord::Base

  FORMAT = /^[a-z_\-\.]$/

  validates_uniqueness_of :name
  validates_presence_of :name

  belongs_to :named, :polymorphic => true

  def to_s
    self.name
  end

  def self.get(name)
    return Uname.first(:conditions => {:name => name}).try(:named)
  end
  
end