class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, through: :rides

    attribute :admin, :boolean, default: false
    validates :name, {presence: true, uniqueness: true}

    def mood
        if self.happiness && self.nausea
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end

    def self.sorted_alphabetical
        all.order(:name, :desc)
    end
end
