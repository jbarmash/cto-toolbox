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
end
