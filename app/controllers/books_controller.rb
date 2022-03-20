class BooksController < ApplicationController
  before_action :correct_user, only: [:update]

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
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
      @book_detail = Book.find(params[:id])
      redirect_to books_path unless @book_detail.user == current_user
  end

  def destroy
       book = Book.find(params[:id])
       @book_detail = Book.find(params[:id])
       book.destroy
        redirect_to books_path
  end

  def update
    @book_detail = Book.find(params[:id])
    if @book_detail.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book_detail.id)
    else
        @books = Book.all
        @user = current_user
        render :edit
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end
