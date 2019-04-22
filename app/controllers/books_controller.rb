class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book), notice: "Book was successfuly created."
		else
			render :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
		@book.user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book), notice: "Book was successfuly update."
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

private
	def book_params
		params.require(:book).permit(:book_title, :book_body)
	end
end
