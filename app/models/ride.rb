class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction


def take_ride
  if !user_has_enough_tickets && user_is_tall_enough
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !user_is_tall_enough && user_has_enough_tickets
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !user_has_enough_tickets  && !user_is_tall_enough
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif user_has_enough_tickets && user_is_tall_enough
        start_ride
 end
end

def start_ride  
    tickets_left = self.user.tickets - self.attraction.tickets
    udate_nausea =  self.user.nausea + self.attraction.nausea_rating
    update_happiness = self.user.happiness + self.attraction.happiness_rating
    self.user.update(tickets: tickets_left, nausea: udate_nausea, happiness: update_happiness)
end

def user_has_enough_tickets
    self.user.tickets >= self.attraction.tickets
end

def user_is_tall_enough
    self.user.height >= self.attraction.min_height
end

end
