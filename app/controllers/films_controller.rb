class FilmsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: [:new, :edit, :destroy]

  def index
    @films = Film.all.order(id: :desc)
  end

  def show
    @film = Film.find(params[:id])
    @review = Review.new(film_id: :review)
    @next_film = @film.next_film
    @previous_film = @film.previous_film
  end

  def new
    @film = Film.new
  end

  def edit
    @film = Film.find(params[:id])
  end

  def create
    @film = Film.new(film_params)
    @film.save
    if @film.new_record?
      render "new"
    else
      redirect_to film_path(@film)
    end
  end

  def update
    film_params

    @film = Film.find(params[:id])

    if @film.update(film_params)
      redirect_to @film
    else
      render "edit"
    end
  end

  def destroy
    film = Film.find(params[:id])
    film.destroy

    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:title,:release_date,:duration,:short_description,:genre,:director,:scenarist,:country)
  end
end
