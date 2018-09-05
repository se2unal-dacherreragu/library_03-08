class BooksController < ApplicationController
  def index
    books = Book.all

    respond_to do |format|
      format.json { render json: books, status:200 }
    end
  end

  def create
    book = Book.new(params_book)

    if book.save
      respond_to do |format|
        format.json { render json: book, status:201 }
      end
    else
      respond_to do |format|
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    book = Book.find(params_book[:id])

    respond_to do |format|
      format.json { render json: book, status:200 }
    end
  end

  def update
    book = Book.find(params_book[:id])

    if book.update(article_params)
      respond_to do |format|
        format.json { render json: book, status:201 }
      end
    else
      respond_to do |format|
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    book = Book.find(params_book[:id])

    if book.destroy(article_params)
      respond_to do |format|
        format.json { render json: book, status:200 }
      end
    else
      respond_to do |format|
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  ##

  def params_book
    params.permit(:name, :code, :avaliable,:year)
  end
end
