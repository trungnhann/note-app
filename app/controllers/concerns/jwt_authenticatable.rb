module JwtAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
    attr_reader :current_user
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    token = header.split.last if header

    begin
      decoded = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
      @current_user = User.find(decoded[0]['id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render_error('Unauthorized access', :unauthorized)
    end
  end
end
