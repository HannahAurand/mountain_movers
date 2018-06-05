class ChaptersController < ApplicationController
    def index
        @chapters = Chapter.all.order("created_at DESC")
    end

    def new
        @chapter = Chapter.new
    end

    def create
        @chapter = Chapter.new(params.require(:chapter).permit(:title, :body))
        if @chapter.save
            redirect_to root_path
        else
            render 'new'
        end
    end
end
