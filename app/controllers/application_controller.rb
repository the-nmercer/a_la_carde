class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  helper_method :current_cart

  private

  def current_cart
    session[:cart] ||= {}
  end
end
