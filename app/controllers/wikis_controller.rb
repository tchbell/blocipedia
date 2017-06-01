class WikisController < ApplicationController
  before_action :signed_in, except: [:index, :show]
  before_action :user_auth, only: [:delete, :edit]
  
  
  def index
    @wikis= Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
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
    
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error in updating the Wiki. Please try again."
      render :edit
    end
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
    unless current_user == wiki.user || current_user.admin?
    flash[:alert] = "You must be the owner to do this!"
    redirect_to wikis_path
    end
  end
  

  
  
  
  
end
