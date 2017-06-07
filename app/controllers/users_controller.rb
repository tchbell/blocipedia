class UsersController < ApplicationController

    
    def role_toggle
        if current_user.standard?
            current_user.premium!
        else
            current_user.standard!
        end
        flash[:notice] = "Role changed to #{current_user.role}"
        redirect_to root_path
    end
      
      
      
    

        
        
end
