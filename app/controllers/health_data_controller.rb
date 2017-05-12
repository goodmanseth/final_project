class HealthDataController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_health_datum, only: [:show, :edit, :update, :destroy]
  require 'action_view'
  include ActionView::Helpers::NumberHelper

  # gmaps_API_KEY: AIzaSyCN0EFji6YhrnAOjacp2bR_BBwM0Z30glI
  # GET /health_data
  # GET /health_data.json
  def index
    if params[:q].blank?
      @q = HealthDatum.none.search
      @none = true
    else
      @q = HealthDatum.ransack(params[:q])
      @none = false
    end
    @health_data = @q.result.order(:average_total_cost).paginate(page: params[:page], per_page: 25)
    @drg_definitions = HealthDatum.all.distinct.pluck(:drg_definition).sort
    @states = HealthDatum.all.distinct.pluck(:provider_state).sort
    @hrr = HealthDatum.distinct.pluck(:hospital_referral_region).sort
    #byebug
  end

  # GET /health_data/1
  # GET /health_data/1.json
  def show
    #byebug
    gon.address = @health_datum.full_street_address
    gon.name1 = @health_datum.name_.split.map(&:capitalize)*' '
    respond_to do |format|
      format.html
      format.json { render json: @health_datum }
    end
  end

  # GET /health_data/new
  def new
    @health_datum = HealthDatum.new
  end

  # GET /health_data/1/edit
  def edit
  end

  # POST /health_data
  # POST /health_data.json
  def create
    @health_datum = HealthDatum.new(health_datum_params)

    respond_to do |format|
      if @health_datum.save
        format.html { redirect_to @health_datum, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @health_datum }
      else
        format.html { render :new }
        format.json { render json: @health_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_data/1
  # PATCH/PUT /health_data/1.json
  def update
    respond_to do |format|
      if @health_datum.update(health_datum_params)
        format.html { redirect_to @health_datum, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_datum }
      else
        format.html { render :edit }
        format.json { render json: @health_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_data/1
  # DELETE /health_data/1.json
  def destroy
    @health_datum.destroy
    respond_to do |format|
      format.html { redirect_to health_data_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def about
  end

  def visualize
    state_data = Array.new
    cost_per_state_array = Array.new
    HealthDatum.all.distinct.pluck(:provider_state).sort.each do |state|
      hash = {
        state: state,
        average_cost: number_with_precision(HealthDatum.where(:provider_state => state).average(:average_total_cost), :precision => 2)
      }
      cost_per_state_array.push(number_with_precision(HealthDatum.where(:provider_state => state).average(:average_total_cost), :precision => 2))
      state_data.push(hash)
    end
    gon.state_data = state_data

    drg_data = Array.new
    HealthDatum.all.distinct.pluck(:drg_definition).sort.each do |drg|
      hash = {
        drg_definition: drg,
        average_cost1: number_with_precision(HealthDatum.where(:drg_definition => drg).average(:average_total_cost), :precision => 2)
      }
    drg_data.push(hash)
    end
    gon.drg_data = drg_data

    gon.state_array = HealthDatum.all.distinct.pluck(:provider_state).sort
    gon.cost_per_state_array = cost_per_state_array
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_datum
      @health_datum = HealthDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_datum_params
      params.fetch(:health_datum, {})
    end
end
