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

  def disable
  end

  def favorites
  end

  def tolearn
  end

end