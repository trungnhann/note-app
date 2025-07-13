# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  normalizes :email, with: ->(email) { email.strip.downcase }
  normalizes :first_name, :last_name, with: ->(value) { value.strip.presence }

  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects

  def generate_jwt
    payload = {
      id: id,
      exp: 24.hours.from_now.to_i
    }

    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
