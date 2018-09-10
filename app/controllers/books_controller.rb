class BooksController < ApplicationController
  def index
    author = Author.find(params[:author_id])
    if author
      books = author.books

      respond_to do |format|
        format.json { render json: books, status:200 }
      end
    end
  end

  def create
    author = Author.find(params[:author_id])

    if author
      book = Book.new(params_book.merge(author_id: author.id))
    end

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
    book = Book.find(params[:id])

    respond_to do |format|
      format.json { render json: book, status:200 }
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    respond_to do |format|
      format.json { render json: book, status:200 }
    end
  end

  def update
    book = Book.find(params[:id])

    if book.update(params_book)
      respond_to do |format|
        format.json { render json: book, status:200 }
      end
    else
      format.json { render json: book.errors, status:422 }
    end
  end

##

  def params_book
    params.permit(:name, :code, :avaliable, :year)
  end
end
