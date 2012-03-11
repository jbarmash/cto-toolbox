class UsersController < ApplicationController


  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def list
  end

  def set_current_user
    @user = User.find(params[:id])
    if @user 
       session[:current_user] = @user.id
       puts "Setting user #{@user}"
       puts "Setting user #{@user}"
       puts "Setting user #{@user}"
       flash[:notice] = "Set user #{@user} as current" 
       redirect_to(users_path)
    else


       flash[:notice] = "Did not find the user with id #{params[:id]}"
       redirect_to(users_path)
    end
  end

  def show
    @user = User.find(params[:id])
  end



  def disable
  end

  def favorites
  end

  def tolearn
  end

end
