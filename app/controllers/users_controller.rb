class UsersController < ApplicationController

    
    def role_toggle
        current_user.wikis.each do |wiki| 
            wiki.private = false
            wiki.save
        end
        
        if current_user.premium?
            current_user.standard!
        end
        
        
        
        flash[:notice] = "Role changed to #{current_user.role}"
        redirect_to root_path
    end
      
      
      
    

        
        
end
