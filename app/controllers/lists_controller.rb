class ListsController < ApplicationController
  def index
    @lists = Board.lists.all
  end

  def show
    @list = Board.lists.find(params[:id])
  end

  def edit
  end

  def new
  end
end
