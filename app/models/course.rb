class Course < ApplicationRecord
    validates :name, presence: true, length: {minimum: 5, maximum: 50}
    validates :short_name, presence: true, length: {minimum: 3, maximum: 50}
    validates :Description, presence:  true, length: {minimum: 5, maximum: 300}
end