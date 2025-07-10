module Auth
  class RegisterService < ApplicationService
    def initialize(register_params)
      @register_params = register_params
    end

    def call
      user = User.new(@register_params)

      return failure('Validation failed', user.errors) unless user.valid?

      ActiveRecord::Base.transaction do
        user.save!
      end

      token = user.generate_jwt

      success({
                token: token,
                user: {
                  id: user.id,
                  email: user.email,
                  first_name: user.first_name,
                  last_name: user.last_name
                }
              }, 'Registration successful')
    rescue ActiveRecord::RecordInvalid => e
      failure('Registration failed', e.record.errors)
    end
  end
end
