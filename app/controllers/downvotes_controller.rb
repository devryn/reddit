class DownvotesController < ApplicationController
  def index
    render locals: {
      downvotes: Downvote.all
    }
  end

  def show
    if Downvote.exists?(params[:id])
    render locals: {
      downvote: Downvote.find(params[:id])
    }
    else
      render html: { message: "Vote not found"}, status: 404
    end
  end

  def new
    render locals: {
      downvote: Downvote.new
    }
  end

  def create
    downvote = Downvote.new(downvote_params)
    if downvote.save
      redirect_to "/links/#{downvote.link_id}"
    else
      render :new
    end
  end

  def edit
    render locals: {
      downvote: Downvote.find(params[:id])
    }
  end

  def update
    if Downvote.exists?(params[:id])
      downvote.update(downvote_params)
      redirect_to "/links/#{downvote.link_id}"
    else
      render :edit
    end
  end

  def destroy
    if Downvote.exists?(params[:id])
      Downvote.destroy(params[:id])
      flash[:notice] = "Vote destroyed"
      redirect_to root
    else
      flash[:alert] = "Vote was not destroyed due to errors."
    end
  end

  private
  def downvote_params
    params.require(:downvote).permit(:link_id, :user_id)
  end
end
