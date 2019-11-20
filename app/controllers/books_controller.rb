class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
  if
    @book.save
    redirect_to book_path(@book.id), flash:{success: "You have creatad book successfully."}
  else
    render action: :index
  end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if
    @book.save
    redirect_to book_path(@book.id), flash:{success: "You have creatad book successfully."}
    else
    render  action: :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
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
end
