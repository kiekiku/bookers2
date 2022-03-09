class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
  end
  
  def create
     @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
    
    def edit
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
