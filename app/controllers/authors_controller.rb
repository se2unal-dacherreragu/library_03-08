class AuthorsController < ApplicationController
    def index
      authors = Author.all
      respond_to do |format|
        format.json { render json: authors, status:200 }
      end
    end

    def create
      author = Author.new(params_author)

      if author.save
        respond_to do |format|
          format.json { render json: author, status:201 }
        end
      else
        respond_to do |format|
          format.json { render json: author.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
      author = Author.find(params[:id])

      respond_to do |format|
        format.json { render json: author, status:200 }
      end
    end

    def destroy
      author = Author.find(params[:id])
      author.destroy

      respond_to do |format|
        format.json { render json: author, status:200 }
      end
    end

    def update
      author = Author.find(params[:id])

      if author.update(params_book)
        respond_to do |format|
          format.json { render json: author, status:200 }
        end
      else
        format.json { render json: book.errors, status:422 }
      end
    end

  ##

    def params_author
      params.permit(:name, :age, :genre)
    end

end
