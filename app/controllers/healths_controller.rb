class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :index, :show ]

  # GET /healths
  # GET /healths.json
  def index
    @healths = Health.all.order("created_at DESC")
  end

  # GET /healths/1
  # GET /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths
  # POST /healths.json
  def create
    @health = Health.new(health_params)
    if @health.save
      flash[:success] = 'Plan de salud creado correctamente.'
      redirect_to @health
    else
      render :new
    end
  end

  # PATCH/PUT /healths/1
  # PATCH/PUT /healths/1.json
  def update
    if @health.update(health_params)
      flash[:success] = 'Plan de salud actualizado correctamente.'
      redirect_to @health
    else
      render :edit
    end
  end


  # DELETE /healths/1
  # DELETE /healths/1.json
  def destroy
    @health.destroy
    respond_to do |format|
      format.html { redirect_to healths_url, notice: 'Plan de salud eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_params
      params.require(:health).permit(:title, :body)
    end
end
