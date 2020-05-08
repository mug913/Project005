class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if  @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: current_user)
        @scores = @user.game_scores.all
    end

    def update
        redirect_to user_path(current_user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, game_scores_attributes: [:score])
    end

    
end
