class Food < ActiveRecord::Base
    validates :name, length: { minimum: 3 },  presence: true
    validates :course, length: { minimum: 3 },  presence: true
    REGEX=/\-?\d+(\.\d{0,})?/i
    validates :price,  presence: true, format: { with: REGEX }
end
