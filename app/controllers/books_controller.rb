class BooksController < ApplicationController

  def new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
        flash[:notice]="You have creatad book successfully."
        redirect_to book_path(@book)
     else
       @user = current_user
       @books = Book.all
       render :index
     end

  end

  def index
      @user = current_user
      @book = Book.new
      @books = Book.all
  end

  def show
    	@book = Book.find(params[:id])
    	@user = User.find(@book.user_id)
    	@book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render "edit"
    else
       redirect_to books_path
    end

  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice]="You have updated book successfully."
        redirect_to book_path(@book.id)
     else
        render :edit
     end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
