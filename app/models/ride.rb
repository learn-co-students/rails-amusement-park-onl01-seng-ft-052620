class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    validates :user_id, presence: true
    validates :attraction_id, presence: true

    def take_ride
        issues = []

        if self.user.tickets < self.attraction.tickets
            issues.append "You do not have enough tickets to ride the #{self.attraction.name}."
        end
        if self.user.height < self.attraction.min_height
                issues.append "You are not tall enough to ride the #{attraction.name}."
        end

        if issues.empty?
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{self.attraction.name}!"
        else
            "Sorry. " + issues.join(" ")
        end
    end
end
