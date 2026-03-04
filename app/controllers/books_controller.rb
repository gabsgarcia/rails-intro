class BooksController < ApplicationController
  def new
  end

  def show
  end

  def index
    @members = [ "thanh", "dimitri", "germain", "damien", "julien" ]

    if params[:member]
      @members = @members.select { |member| member.start_with?(params[:member]) }
    end
  end
end
