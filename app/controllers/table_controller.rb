class TableController < ApplicationController
    def index
        @tables = ActiveRecord::Base.connection.tables
    end
    
    def show
        @detail = Module.const_get(params[:id].classify).column_names
    end
end
