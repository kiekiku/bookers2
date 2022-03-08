class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @user = current_user
    
  end

  def show
  end
end
