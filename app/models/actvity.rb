class Actvity < ApplicationRecord
    has_many :signups
    has_many :campers, through: :signups

    validates_inclusion_of :time, in: 0..23
end
