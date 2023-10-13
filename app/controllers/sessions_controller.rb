class SessionsController < ApplicationController
  
  
  # Build 'new' action for SessionsController
  def new
  end

  # Build 'create' action for SessionsController
  def create
    user = User.find_by_email(params[:email])

    # If user exists and password entered is correct
    if user && user.authenticate(params[:password])

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