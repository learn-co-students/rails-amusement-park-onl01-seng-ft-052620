class Attraction < ApplicationRecord
    has_many :rides
    has_many :users, through: :rides

    def num_users
        self.users.count
    end
end
