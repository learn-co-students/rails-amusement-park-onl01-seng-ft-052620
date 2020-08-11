class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.tickets < attraction.tickets
      errors.messages[:tickets] = "You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      errors.messages[:height] = "You are not tall enough to ride the #{attraction.name}."
    end

    if errors.messages.empty?
      user.update(
        tickets: user.tickets - attraction.tickets,
        nausea: user.nausea + attraction.nausea_rating,
        happiness: user.happiness + attraction.happiness_rating,
      )
      "Thanks for riding the #{attraction.name}!"
    else
      "Sorry. " + errors.messages.values.join(" ")
    end
  end
end
