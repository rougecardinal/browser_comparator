class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale

  def change_locale
    I18n.locale = params[:locale_name]
    redirect_to root_path
  end


  private
  def set_locale
    I18n.locale = params[:locale] if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
  end
end
