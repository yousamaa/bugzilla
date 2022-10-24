# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name type])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name type])
  end

  def record_not_found
    redirect_to root_path
    flash[:notice] = 'Record not Found!'
  end

  def record_not_unique
    redirect_to root_path
    flash[:notice] = 'Record not unique!'
  end
end
