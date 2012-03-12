class TagsController < ApplicationController

  def index
    @tags = Tag.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
 
end
