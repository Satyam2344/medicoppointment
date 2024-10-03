class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :phone, presence: true,  length: { minimum: 10, maximum: 15 }
    validates :address, presence: true, length: { minimum: 5, maximum: 100 }
    validates :role, presence: true, inclusion: { in: %w(admin doctor receptionist) }
    validates :password, presence: true, length: { minimum: 8, maximum: 128 }
end
