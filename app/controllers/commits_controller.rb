class CommitsController < ApplicationController

  def create
    commit = Commit.new(build_params)
    if commit.save
      render json: "", status: 201
    end
  end

  private

  def commit_params
    params.require(:head_commit).permit(:id, :message, :timestamp, author: [:username])
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
