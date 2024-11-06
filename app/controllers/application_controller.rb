class ApplicationController < ActionController::Base
    before_action :set_locale
  
    private
  
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      session[:locale] = I18n.locale # Almacena la preferencia de idioma en la sesión
    end
  
    def default_url_options
      { locale: I18n.locale }
    end
  end