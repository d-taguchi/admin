class TableController < ApplicationController
    def index
        @tables = ActiveRecord::Base.connection.tables
    end
    def show
        # params[:id]
        #
        @detail = Manager.columns
        # @detail = Module.const_get('managers'.classify).columns
    end
end
