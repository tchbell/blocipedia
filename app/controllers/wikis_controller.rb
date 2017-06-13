class WikisController < ApplicationController
  before_action :signed_in, except: [:index, :show]
  before_action :user_auth, only: [:destroy]
  
  
   def index
     @wikis = policy_scope(Wiki)
   end

  def show
    @collaborators = Collaborator.all
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error in creating the Wiki. Please try again."
      render :new
    end
  end
  


  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    
    #add collaborator
    @collaborator = User.find(params[:wiki][:user_id])
    unless @wiki.users.include?(@collaborator)
      @wiki.users << @collaborator
    end
    
    #remove collaborator
    @wiki.users.delete(User.find(params[:wiki][:user]))
    
    
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error in updating the Wiki. Please try again."
      render :edit
    end
    
  end
  
  # Use outside of create method
  def add_collab
     @collaborator = User.find(params[:wiki][:user_id])
    unless @wiki.users.include?(@collaborator)
      @wiki.users << @collaborator
    end
  end
  
  def remove_collab
    @wiki.users.delete(User.find(params[:wiki][:user]))
  end
  
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
    end
  end
  
  private
  
  def signed_in
    unless current_user
    flash[:alert] = "You must be logged in to do this!"
    redirect_to new_user_session_path
    end
  end
  
  def user_auth
    wiki = Wiki.find(params[:id])
    unless current_user == wiki.user || current_user.admin? || current_user.premium?
    flash[:alert] = "You must be the owner to do this!"
    redirect_to wikis_path
    end
  end
  
  

  
  
  
  
end
