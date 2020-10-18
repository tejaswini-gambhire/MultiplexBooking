class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to (request.referrer || root_path), alert: I18n.t('errors.not_authorized')
  end
end
