class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.user.tickets < ride.tickets && self.user.height < ride.min_height
        "Sorry. You do not have enough tickets to ride the #{ride.name}. You are not tall enough to ride the #{ride.name}." 
        elsif self.user.tickets < ride.tickets
        "Sorry. You do not have enough tickets to ride the #{ride.name}."
        elsif self.user.height < ride.min_height
            "Sorry. You are not tall enough to ride the #{ride.name}."
        else
            self.user.tickets -= ride.tickets
            self.user.nausea += ride.nausea_rating
            self.user.happiness += ride.happiness_rating
            self.user.save
        end
    end

    def ride
        self.attraction
    end

end
