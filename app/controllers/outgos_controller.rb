require 'pp'
class OutgosController < ApplicationController
  before_action :set_outgo, only: [:show, :edit, :update, :destroy]

  # GET /outgos
  # GET /outgos.json
  def index
    @outgos = Outgo.all
    render json: @outgos, status: 200
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

    if @outgo.save
      render json: @outgo, status: :created, location: @outgo
    else
      render json: @outgo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outgos/1
  # PATCH/PUT /outgos/1.json
  def update
    if @outgo.update(outgo_params)
      render json: @outgo, status: :ok, location: @outgo
    else
      render json: @outgo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outgos/1
  # DELETE /outgos/1.json
  def destroy
    @outgo.destroy
    render nothing: true, status: 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgo
      @outgo = Outgo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgo_params
      params.require(:outgo).permit(:user, :title, :price)
    end
end
