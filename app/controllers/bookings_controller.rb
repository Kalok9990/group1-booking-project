class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @start_date = params.fetch(:start_date, Date.today).to_date
    @date_range = (@start_date..(@start_date)).to_a
    @week_range = (@start_date.beginning_of_week..(@start_date.beginning_of_week+ 4.day)).to_a
    @rooms = Room.all
    @bookings = Booking.all
    @booking = Booking.new
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @rooms = Room.all
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    @rooms = Room.all
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)


    respond_to do |format|
      if @booking.save
        format.html { redirect_to rooms_path, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to rooms_path, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy

    @booking.destroy
    respond_to do |format|
      format.html { redirect_to '/rooms', notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:scaffold_controller, :description, :date_in, :date_out, :room_id)
    end
end
