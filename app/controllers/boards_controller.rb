class BoardsController < ApplicationController

  def index
    boards = Board.all.page params[:page]
    render locals: {
      boards: boards
    }
  end

  def show
    if Board.exists?(params[:id])
    render locals: {
      board: Board.find(params[:id])
    }
    else
      render html: { message: "Board not found"}, status: 404
    end
  end

  def new
    render locals: {
      board: Board.new
    }
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to root
    else
      render :new, locals: {
        board: board
      }
    end
  end

  def edit
    render locals: {
      board: Board.find(params[:id])
    }
  end

  def update
    if Board.exists?(params[:id])
      board.update(board_params)
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
    if Board.exists?(params[:id])
      Board.destroy(params[:id])
      flash[:notice] = "Board destroyed"
      redirect_to root
    else
      flash[:alert] = "Board was not destroyed due to errors."
    end
  end
end

private
def board_params
  params.require(:board).permit(:name)
end
