class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: [:destroy]

  def create
    @film = Film.find(params[:film_id])
    @review = Review.new(film_id: @film.id)
    @review.attributes = review_params

    if @review.save
      redirect_to film_path(@film)
    else
      render "films/show"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy

    redirect_to film_path(review.film)
  end

  private

  def review_params
    review_params = params.require(:review).permit(:first_name, :surname, :rating, :short_opinion)
  end
end
