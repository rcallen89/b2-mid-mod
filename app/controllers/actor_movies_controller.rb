class ActorMoviesController < ApplicationController

  def create
    actor = Actor.find_by(name: params[:actor])
    movie = Movie.find(params[:id])
    ActorMovie.create!(actor: actor, movie: movie)
    redirect_to "/movies/#{params[:id]}"
  end

end