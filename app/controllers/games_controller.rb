class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @user = current_user

    @game = Game.new(challenge: @challenge, user: @user, completed: false)
    @game.save

    respond_to do |format|
      format.html { redirect_to @game }
      format.json { render json: @game }
    end
  end
end
