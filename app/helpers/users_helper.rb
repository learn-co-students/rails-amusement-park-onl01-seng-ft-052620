module UsersHelper

    def mood(user)
        unless user.admin == true
          user.happiness > user.nausea ? "happy" : "sad"
        end
    end
end
