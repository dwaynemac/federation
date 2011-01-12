class Uname < ActiveRecord::Base

  validates_uniqueness_of :name
  validates_presence_of :name

  belongs_to :named, :polymorphic => true

  def to_s
    self.name
  end
end