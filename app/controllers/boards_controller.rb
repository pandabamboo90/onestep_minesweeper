class BoardsController < ApplicationController
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards or /boards.json
  def index
    @pagy, @boards = pagy(Board.includes(:user).order(id: :desc))
  end

  # GET /boards/1 or /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @user = User.new
    @board = @user.boards.build
  end

  # POST /boards or /boards.json
  def create
    @user = User.find_or_initialize_by(email: user_params[:email])
    @user.save

    @board = Board.new(board_params)
    @board.user = @user if @user.persisted?

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:name, :width, :height, :num_of_mines)
  end

  def user_params
    params.require(:board).require(:user).permit(:email)
  end
end
