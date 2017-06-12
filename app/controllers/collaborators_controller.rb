class CollaboratorsController < ApplicationController
    
    
def index 
   @collaborators =  Collaborator.all 
end

def create 
    wiki = Wiki.find(params[:id])
    user = User.find(params[:id])
    
    
    @collaborator = wiki.users << user
    
    if @collaborator.save
        flash[:notice] = "Collaborator added"
        redirect_to wiki
    else
        flash[:alert] = "Failed"
        redirect_to wiki
    end
end

def destroy 
end


end
