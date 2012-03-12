class ToolsController < ApplicationController
  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool.all

    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tools }
    end
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
    @tool = Tool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tool }
    end
  end

  def search_by_name
    @tools = Tool.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @tools.map(&:name)
  end


  # GET /tools/new
  # GET /tools/new.json
  def new
    @tool = Tool.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tool }
    end
  end

  # GET /tools/1/edit
  def edit
    @tool = Tool.find(params[:id])
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        format.html { redirect_to @tool, notice: 'Tool was successfully created.' }
        format.json { render json: @tool, status: :created, location: @tool }
      else
        format.html { render action: "new" }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tools/1
  # PUT /tools/1.json
  def update
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes(params[:tool])
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to tools_url }
      format.json { head :ok }
    end
  end

  def add_to_favorites
    logger.warn "param #{params}, session #{session}"
    @tool = Tool.find(params[:id])
    @user = User.find(session[:current_user])

    if session[:current_toolbox]
        @current_toolbox = Toolbox.find(session[:current_toolbox])
        if !@current_toolbox.tools.include? @tool
           @current_toolbox.tools <<@tool 
           @current_toolbox.save
        end
    end

    
 
    #logger.info "user #{@user}, tool #{@tool}, toolbo_tools: #{@user.toolbox_tools}"
    #@user.set_mark :toolbox, @tool
    if !@user.tools.include? (@tool)
        @user.tools << @tool 
    end
    @user.save

    flash[:notice] = "Added Tool #{@tool.name} to #{@user.name}'s toolbox"

    @tools = Tool.all
    render 'index'
  end

def remove_from_favorites
    logger.warn "param #{params}, session #{session}"
    flash[:notice] = "Removing Tools not implemented yet" 
    @tools = Tool.all
    render 'index'
 end




#  def add_to_interested
#    @tool = Tool.find(params[:id])
#    @user = User.find(session[:current_user])
#    logger.info "BASSAFDASDFASF, user #{@user}, tool #{@tool}"
#    @user.interested_tools << @tool  
#    render 'index'
#  end


  def filter_by_tag
    @tools = Tool.tagged_with(params[:tag_name])
    render 'index'
    #match 'tools/tag/:tag_name' => 'tools#filter_by_tag', :as => 'tool_filter_by_tag', :via => "get"
  end


  def my_tools
    @user = User.find(session[:current_user])
    @tools = @user.tools 
    flash[:notice] = "Showing #{@user.name}'s ToolBox"
    render 'index'
  end


end
