class CommitsController < ApplicationController

  def create
    commit = Commit.new(build_params)
    if commit.save
      render json: "", status: 201
    else
      render json: "Bad Commit", status: 401
    end
  end

  private

  def commit_params
    params.require(:payload).permit(head_commit: [:id, :message, :timestamp, author: [:username]])[:head_commit]
  end

  def build_params
    {
      sha: commit_params[:id][0..11],
      message: commit_params[:message],
      commit_timestamp: commit_params[:timestamp],
      author: commit_params[:author][:username]
    }
  end

end
