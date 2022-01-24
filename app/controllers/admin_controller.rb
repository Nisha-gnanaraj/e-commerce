class AdminController < ApplicationController
    def login
      if request.post?
        if params[:name] == "admin" &&  params[:password] == "welcome"
            session[:admin] = "loginadmin"
            flash[:notice] = "welcome admin"
            redirect_to :controller => :stores
        else
          flash[:notice] = "Please enter valid credinals" 
          render :action => :login  
        end
      end 
    end
  
    def logout
      flash[:notice] = "you are logged out"
      session[:admin] = nil
      redirect_to :action => :login
    end
  end
  