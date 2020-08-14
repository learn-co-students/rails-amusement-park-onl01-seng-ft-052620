module AttractionsHelper

    def ride_user
        User.find_by_id(session[:user_id])
    end

    def adjust_user(user)
        user.tickets-= @attraction.tickets 
        user.happiness+= @attraction.happiness_rating
        user.nausea+= @attraction.nausea_rating
        user.save
    end
    
end
