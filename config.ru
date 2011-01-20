# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# TODO add cas_user to User and add configuration:
# :user_model => User, :drc_user_column => 'cas_user', :require_local_user => true
DRCClient.configure(:base_url => DRC_SERVER)

run Fed::Application
