class SessionsController < ActionController::Base

    def new
        @user = User.new
        render :index
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            redirect_to '/' 
        end
            
    end

    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end