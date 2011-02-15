class User < ActiveRecord::Base
  
  devise :cas_authenticatable, :trackable

  belongs_to :federation
  validates_presence_of :federation

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :federation_id

  # observations this user made to people
  has_many :observations, :foreign_key => "observer_id"
end
