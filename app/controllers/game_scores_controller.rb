class GameScoresController < ApplicationController

    def new
        @score = GameScore.new
    end
    
    def create
        @score = current_user.game_scores.build(score_params)
        if  @score.save
          redirect_to user_path(current_user)
        else
          render :new
        end
    end

    private

    def score_params
        params.require(:score).permit(:score,:date)
    end

end
