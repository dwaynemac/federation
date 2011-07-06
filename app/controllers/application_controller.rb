class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :set_locale

  def set_locale
    I18n.locale = current_user.locale if user_signed_in? && ['es', 'en'].include?(current_user.locale)
    I18n.locale = params[:locale] unless params[:locale].nil?
  end
end
