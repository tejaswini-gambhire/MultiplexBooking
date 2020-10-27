class ShowsController < ApplicationController
  before_action :load_show, except: [:index, :create]

  def seats
    authorize @show, :seats?
    @seats = @show.seats.order(id: :asc).group_by(&:position)

    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  private

  def load_show
    @show = Show.find_by(id: params[:id])

    unless @show
      flash[:error] = I18n.t('show.not_found')
      redirect_to movies_path
    end
  end
end
