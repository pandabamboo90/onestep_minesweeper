class User < ApplicationRecord

  # Associations
  has_many :boards

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: true}, format: { with: URI::MailTo::EMAIL_REGEXP }
end
