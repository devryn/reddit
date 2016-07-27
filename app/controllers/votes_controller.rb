class VotesController < ApplicationController
    def index
      render locals: {
        votes: Vote.all
      }
    end

    def show
      if Vote.exists?(params[:id])
      render locals: {
        vote: Vote.find(params[:id])
      }
      else
        render html: { message: "Vote not found"}, status: 404
      end
    end

    def new
      render locals: {
        vote: Vote.new
      }
    end

    def create
      vote = Vote.new(vote_params)
      if vote.save
        redirect_to vote
      else
        render :new
      end
    end

    def edit
      render locals: {
        vote: Vote.find(params[:id])
      }
    end

    def update
      if Vote.exists?(params[:id])
        vote.update(vote_params)
        redirect_to vote
      else
        render :edit
      end
    end

    def destroy
      if Vote.exists?(params[:id])
        Vote.destroy(params[:id])
        flash[:notice] = "Vote destroyed"
        redirect_to votes
      else
        flash[:alert] = "Vote was not destroyed due to errors."
      end
    end

  private
  def vote_params
    params.require(:vote).permit(:link_id)
  end

end
