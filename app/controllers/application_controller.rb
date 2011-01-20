class ApplicationController < ActionController::Base
  protect_from_forgery

  include DRCClient::HelperMethods

  #before_filter DRCClient.filter

  private
  def login_required
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
