class UpvotesController < ApplicationController
    def index
      render locals: {
        upvotes: Upvote.all
      }
    end

    def show
      if Upvote.exists?(params[:id])
      render locals: {
        upvote: Upvote.find(params[:id])
      }
      else
        render html: { message: "Vote not found"}, status: 404
      end
    end

    def new
      render locals: {
        upvote: Upvote.new
      }
    end

    def create
      upvote = Upvote.new(upvote_params)
      if upvote.save
        redirect_to "/links/#{upvote.link_id}"
      else
        render :new
      end
    end

    def edit
      render locals: {
        upvote: Upvote.find(params[:id])
      }
    end

    def update
      if Upvote.exists?(params[:id])
        upvote.update(upvote_params)
        redirect_to "/links/#{upvote.link_id}"
      else
        render :edit
      end
    end

    def destroy
      if Upvote.exists?(params[:id])
        Upvote.destroy(params[:id])
        flash[:notice] = "Vote destroyed"
        redirect_to root
      else
        flash[:alert] = "Vote was not destroyed due to errors."
      end
    end

  private
  def upvote_params
    params.require(:upvote).permit(:link_id, :user_id)
  end

end
