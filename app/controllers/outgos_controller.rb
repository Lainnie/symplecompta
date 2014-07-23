class OutgosController < ApplicationController
  before_action :set_outgo, only: [:show, :edit, :update, :destroy]

  # GET /outgos
  # GET /outgos.json
  def index
    @outgos = Outgo.all
  end

  # GET /outgos/1
  # GET /outgos/1.json
  def show
  end

  # GET /outgos/new
  def new
    @outgo = Outgo.new
  end

  # GET /outgos/1/edit
  def edit
  end

  # POST /outgos
  # POST /outgos.json
  def create
    @outgo = Outgo.new(outgo_params)

    respond_to do |format|
      if @outgo.save
        format.html { redirect_to @outgo, notice: 'Outgo was successfully created.' }
        format.json { render :show, status: :created, location: @outgo }
      else
        format.html { render :new }
        format.json { render json: @outgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outgos/1
  # PATCH/PUT /outgos/1.json
  def update
    respond_to do |format|
      if @outgo.update(outgo_params)
        format.html { redirect_to @outgo, notice: 'Outgo was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgo }
      else
        format.html { render :edit }
        format.json { render json: @outgo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgos/1
  # DELETE /outgos/1.json
  def destroy
    @outgo.destroy
    respond_to do |format|
      format.html { redirect_to outgos_url, notice: 'Outgo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgo
      @outgo = Outgo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgo_params
      params[:outgo]
    end
end
