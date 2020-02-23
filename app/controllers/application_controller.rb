class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize
    @tenant = Tenant.find_by(api_key: params[:api_key])

    render json: { errors: ["Invalid API Key"] }, status: :unauthorized if @tenant.nil?
  end
end
