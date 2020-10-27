class MoviesController < ApplicationController
  before_action :load_movie, except: :index

  def index
    authorize Movie
    @movies = Movie.active
  end

  def shows
    authorize @movie, :shows?
    @shows = @movie.shows.upcoming_shows.includes(:screen)
  end

  private

  def load_movie
    @movie = Movie.find_by(id: params[:id])
    unless @movie
      flash[:error] = I18n.t('movie.not_found')
      redirect_to movies_path
    end
  end
end
