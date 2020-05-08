class GameTablesController < ApplicationController

    def new
        @table = GameTable.new
    end
    
    def create
        @table = GameTable.new(table_params)
        if  @table.save
            session[:table_id] = @table.id
            redirect_to user_path(@table)
        else
            render :new
        end
    end

    private

    def table_params
        params.require(:table).permit(:name, :year)
    end
end
