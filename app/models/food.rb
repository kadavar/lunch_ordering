class Food < ActiveRecord::Base
    validates :name, length: { minimum: 3 },  presence: true
    validates :type, length: { minimum: 3 },  presence: true
end
