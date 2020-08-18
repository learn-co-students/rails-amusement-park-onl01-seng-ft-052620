class User < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    
    def mood
        if self.nausea && self.nausea > self.happiness
            'sad'
        else
            'happy'
        end
    end
end