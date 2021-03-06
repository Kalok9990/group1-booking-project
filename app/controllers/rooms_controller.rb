class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @start_date = params.fetch(:start_date, Date.today).to_date
    @date_range = (@start_date..(@start_date)).to_a

    @rooms = Room.all
    @bookings = Booking.all
    @booking = Booking.new

  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @rooms = Room.all

  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  def day
    @start_date = params.fetch(:start_date, Date.today).to_date
    @date_range = (@start_date..(@start_date)).to_a
    @week_range = (@start_date.beginning_of_week..(@start_date.beginning_of_week+ 4.day)).to_a
    @rooms = Room.all
    @bookings = Booking.all
    @booking = Booking.new
  end

  def week
    @start_date = params.fetch(:start_date, Date.today).to_date
    @date_range = (@start_date..(@start_date)).to_a
    @week_range = (@start_date.beginning_of_week..(@start_date.beginning_of_week+ 4.day)).to_a
    @rooms = Room.all
    @bookings = Booking.all
    @booking = Booking.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_path, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to '/week', notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_path, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :color)
    end
end
