class UsersController < ApplicationController

    def show
        @user = User.find_by(id: current_user)
        @scores = @user.game_scores.desc_order
        
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
