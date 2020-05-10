class GameScoresController < ApplicationController

    def new
        if params[:game_table_id] && table = GameTable.find_by_id(params[:game_table_id])
            @score = table.game_scores.build
        else
            @score = GameScore.new
        end
    end
    
    def create
        @score = current_user.game_scores.build(score_params)
        if  @score.save!
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    private

    def score_params
        params.require(:game_score).permit(:score, :score_date, :game_table_id)
    end

end
