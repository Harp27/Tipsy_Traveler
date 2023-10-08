class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :username, type: String
  field :password_digest, type: String

  has_secure_password

  # Add any other fields or validations you need
end