module Api
  module V1
    class AuthController < BaseController
      skip_before_action :authenticate_user, only: %i[login signup]

      def signup
        password_errors = validate_password(params[:user][:password])
        if password_errors.any?
          render_error(I18n.t('auth.password.invalid'), :unprocessable_entity, password_errors)
          return
        end

        result = Auth::RegisterService.call(user_signup_params)

        if result.success?
          render_success(result.data, I18n.t('auth.signup.success'), :created)
        else
          render_error(I18n.t('auth.signup.failure'), :unprocessable_entity, result.errors)
        end
      end

      def login
        result = Auth::LoginService.call(user_login_params)

        if result.success?
          render_success(result.data, I18n.t('auth.login.success'), :ok)
        else
          render_error(I18n.t('auth.login.failure'), :unauthorized, result.errors)
        end
      end

      private

      def user_signup_params
        params.expect(user: %i[email password first_name last_name])
      end

      def user_login_params
        params.expect(user: %i[email password])
      end

      def validate_password(password)
        errors = []

        errors << I18n.t('auth.password.too_short') if password.nil? || password.length < 8

        # # Kiểm tra có ít nhất một chữ cái viết hoa
        # errors << 'Mật khẩu phải có ít nhất một chữ cái viết hoa' unless password =~ /[A-Z]/

        # # Kiểm tra có ít nhất một chữ cái viết thường
        # errors << 'Mật khẩu phải có ít nhất một chữ cái viết thường' unless password =~ /[a-z]/

        # # Kiểm tra có ít nhất một chữ số
        # errors << 'Mật khẩu phải có ít nhất một chữ số' unless password =~ /[0-9]/

        # # Kiểm tra có ít nhất một ký tự đặc biệt
        # errors << 'Mật khẩu phải có ít nhất một ký tự đặc biệt' unless password =~ /[^A-Za-z0-9]/

        errors
      end
    end
  end
end
