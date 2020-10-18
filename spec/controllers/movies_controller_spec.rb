require 'rails_helper'

describe MoviesController do

  context '#index' do
    it 'should be accessible to admin'
    it 'should be accessible to customer'
    it 'should give list of active movies'
  end

  context '#shows' do
    it 'should be accessible to admin'
    it 'should be accessible to customer'
    it 'should give list of shows for a movie'
    it 'should give list of upcoming shows'
  end
end