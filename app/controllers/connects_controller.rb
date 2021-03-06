class ConnectsController < ApplicationController
  before_action :set_connect, only: %i[ show edit update destroy ]

  # GET /connects or /connects.json
  def index
    @connects = Connect.all
  end

  # GET /connects/1 or /connects/1.json
  def show
  end

  # GET /connects/new
  def new
    if params[:back]
      @connect = Connect.new(connect_params)
    else
      @connect = Connect.new
    end
  end

  def confirm
    @connect = current_user.connects.build(connect_params)
    render :new if @connect.invalid?
  end

  # GET /connects/1/edit
  def edit
    if @connect.user_id != current_user.id
      redirect_to connects_path
    end
  end

  # POST /connects or /connects.json
  def create
    @connect = current_user.connects.build(connect_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @connect.save
          format.html { redirect_to connect_url(@connect), notice: "Connect was successfully created." }
          format.json { render :show, status: :created, location: @connect }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @connect.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /connects/1 or /connects/1.json
  def update
    respond_to do |format|
      if @connect.update(connect_params)
        format.html { redirect_to connect_url(@connect), notice: "Connect was successfully updated." }
        format.json { render :show, status: :ok, location: @connect }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connects/1 or /connects/1.json
  def destroy
    if @connect.user_id != current_user.id
      redirect_to connects_path
    end
    @connect.destroy

    respond_to do |format|
      format.html { redirect_to connects_url, notice: "Connect was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_connect
    @connect = Connect.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def connect_params
    params.require(:connect).permit(:content, :imagetext, :imagetext_cache)
  end
end
