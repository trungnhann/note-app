module Auth
  class LoginService < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      email = @params[:email]&.strip&.downcase
      password = @params[:password]

      return failure(I18n.t('auth.login.email_blank')) if email.blank?

      user = User.find_by(email: email)
      return failure(I18n.t('auth.login.invalid_credentials')) unless user

      return failure(I18n.t('auth.login.invalid_credentials')) unless user.authenticate(password)

      token = user.generate_jwt

      success(
        {
          token: token,
          user: {
            id: user.id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name
          }
        }, I18n.t('auth.login.success')
      )
    end
  end
end
