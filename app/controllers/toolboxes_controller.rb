class ToolboxesController < ApplicationController
  # GET /toolboxes
  # GET /toolboxes.json
  def index
    @toolboxes = Toolbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @toolboxes }
    end
  end

  # GET /toolboxes/1
  # GET /toolboxes/1.json
  def show
    @toolbox = Toolbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @toolbox }
    end
  end

  # GET /toolboxes/new
  # GET /toolboxes/new.json
  def new
    @toolbox = Toolbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @toolbox }
    end
  end

  # GET /toolboxes/1/edit
  def edit
    @toolbox = Toolbox.find(params[:id])
  end

  # POST /toolboxes
  # POST /toolboxes.json
  def create
    @toolbox = Toolbox.new(params[:toolbox])

    respond_to do |format|
      if @toolbox.save
        format.html { redirect_to @toolbox, notice: 'Toolbox was successfully created.' }
        format.json { render json: @toolbox, status: :created, location: @toolbox }
      else
        format.html { render action: "new" }
        format.json { render json: @toolbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /toolboxes/1
  # PUT /toolboxes/1.json
  def update
    @toolbox = Toolbox.find(params[:id])

    respond_to do |format|
      if @toolbox.update_attributes(params[:toolbox])
        format.html { redirect_to @toolbox, notice: 'Toolbox was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @toolbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toolboxes/1
  # DELETE /toolboxes/1.json
  def destroy
    @toolbox = Toolbox.find(params[:id])
    @toolbox.destroy

    respond_to do |format|
      format.html { redirect_to toolboxes_url }
      format.json { head :ok }
    end
  end
end
