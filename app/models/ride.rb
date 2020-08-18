class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        message = "Sorry. "
        too_short = "You are not tall enough to ride the #{self.attraction.name}."
        no_tickets = "You do not have enough tickets to ride the #{self.attraction.name}."
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            message += no_tickets + " " + too_short
        elsif self.user.tickets < self.attraction.tickets
            message += no_tickets
        elsif self.user.height < self.attraction.min_height
            message += too_short
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
        end
        message
    end
end
