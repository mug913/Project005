class GameScoresController < ApplicationController

    before_action :authenticate_user!
    
    def new
        if params[:game_table_id] && table = GameTable.find_by_id(params[:game_table_id])
            @score = table.game_scores.build
        else
            @user = current_user
            @score = GameScore.new
        end
    end
    
    def create
        @user = current_user
        @score = current_user.game_scores.build(score_params)
        if  @score.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def index
        if (params[:user_id])
            @user = User.find_by_id(params[:user_id])
            @scores = @user.game_scores
        else
            @scores = GameScore.all
        end
        @scores = @scores.search(params[:search][:game_table]) if (params[:search]) 
    end


    private

    def score_params
        params.require(:game_score).permit(:score, :score_date, :game_table_id, :search)
    end

end
