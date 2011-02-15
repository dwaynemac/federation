class MainController < ApplicationController

  skip_filter :authenticate_user!, :only => [:index, :public]
  before_filter :avoid_loop, :only => :index

  def index
    respond_to do |format|
      format.html
    end
  end

  def public
    respond_to do |format|
      format.html { render :layout => 'public' }
    end
  end

  private

  # if CAS user has no local user this will avoid a loop from being created.
  def avoid_loop
    unless user_signed_in?
      if session[:tried_login]
        session[:tried_login] = false
        redirect_to public_url
      else
        session[:tried_login] = true
        redirect_to new_user_session_url
      end
    end
  end

end
