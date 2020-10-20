class ShowsController < ApplicationController
  before_action :load_show, except: [:index, :create]

  def seats
    authorize @show, :seats?
    @seats = @show.seats.order(id: :asc).group_by(&:position)
  end

  private

  def load_show
    @show = Show.find_by(id: params[:id])
    redirect_to request.referrer and return not_found unless @show
  end
end
