module Authenticable

  # Find the user based on Authorization headers
  def api_current_user
    @current_user ||= User.find_by(authentication_token: request.headers['Authorization'])
  end

  # Checks whether we have an authenticated user
  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless user_signed_in?
  end

  # Checks if we have a user for api_current_user
  def user_signed_in?
    api_current_user.present?
  end
end