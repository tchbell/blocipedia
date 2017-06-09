class CollaboratorsController < ApplicationController

def create 
    user = User.find(params[:user_id])
    collaborator = user
    
    if collaborator.save
        flash[:notice] = "#{collaborator.email} was added as a collaborator"
    else
        flash[:alert] = "Failed"
    end
end

def destroy 
end


end
