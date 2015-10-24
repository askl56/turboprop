class ApplicationController < ActionController::Base
  include Pundit


  after_action :verify_authorized, except: [:index], unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index], unless: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    redirect_to root_path, alert: "You aren't allowed to do that."
  end
end
