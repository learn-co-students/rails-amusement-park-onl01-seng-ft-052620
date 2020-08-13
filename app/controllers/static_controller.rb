class StaticController < ApplicationController
    skip_before_action :online_user, only: [:home]
  
    def home
        
    end
  end