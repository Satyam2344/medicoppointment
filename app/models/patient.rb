class Patient < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :phone, presence: true,  length: { minimum: 10, maximum: 15 }
    validates :age, presence: true, length: { minimum: 1, maximum: 500 }
    validates :summary, presence: true, length: { minimum: 5, maximum: 500 }
    validates :doctor, presence: true, length: { minimum: 3, maximum: 50 }
    validates :appointment, presence: true, length: { minimum: 3, maximum: 50 }
    validates :status, presence: true, length: { minimum: 1, maximum: 10 }


    scope :created_per_day, -> { group("DATE_TRUNC('day', created_at)").count }

end

