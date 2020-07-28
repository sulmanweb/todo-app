require 'bcrypt'
class User
  include BCrypt
  include Mongoid::Document
  # Schema
  field :email, type: String
  field :password_digest, type: String

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: {minimum: 8, maximum: 72}, if: :password_required?

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  private

  # is password required for user?
  def password_required?
    password_digest.nil? || !password.blank?
  end
end
