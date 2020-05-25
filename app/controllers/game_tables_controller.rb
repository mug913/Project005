class GameTablesController < ApplicationController

    before_action :authenticate_user!
    
    def new
        @table = GameTable.new
        @user = current_user
    end
    
    def create
        @table = current_user.game_tables.build(table_params)
        if  @table.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    private

    def table_params
        params.require(:game_table).permit(:name, :year, game_scores_attributes: [:score, :score_date, :user_id])
    end
end
