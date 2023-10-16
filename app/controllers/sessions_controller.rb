class SessionsController < ApplicationController
  
  
  # Build 'new' action for SessionsController
  def new
  end

  # Build 'create' action for SessionsController
  def create
    # If user is successfully authenticated
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      
    # Save the user id inside the browser cookie and it will keep the user 
    # logged in when he navigate around our website.
      session[:user_id] = user.id
        redirect_to '/'
      else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  # Build 'destroy' action for SessionsController
  def destroy
    # Remove session cookie
    session[:user_id] = nil
       redirect_to '/login'
  end
end