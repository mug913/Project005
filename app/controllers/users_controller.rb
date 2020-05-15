class UsersController < ApplicationController

    def show
        @user = User.find_by(id: current_user)
        @scores = @user.game_scores.desc_date
        @table = GameTable.find_by(id: @user.game_scores.fav_table)
                
    end

    def most_scores
        @topuser = User.find_by(id: GameScore.topuser)
    end

    def update
        redirect_to user_path(current_user)
    end

    def destroy
 #       current_user.invalidate_all_sessions!
 #       super
        reset_session
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, game_scores_attributes: [:score])
    end

    
end
