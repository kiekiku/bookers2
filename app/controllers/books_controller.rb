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
    @user = current_user
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id

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
