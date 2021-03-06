class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
  	@books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if  @book.save
    redirect_to book_path(@book.id), flash:{success: "You have creatad book successfully."}
  else
    @user = current_user
    render action: :index
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if  @book.save
    redirect_to book_path(@book.id), flash:{success: "You have update book successfully."}
    else
    render  action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
  	params.require(:book).permit(:title,:body)
  end

  def correct_user
  book = Book.find(params[:id])
  if book.user != current_user
  redirect_to books_path
  end
  end

end
