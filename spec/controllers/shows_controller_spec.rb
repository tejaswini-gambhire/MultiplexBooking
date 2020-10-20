require 'rails_helper'

describe ShowsController do

  context '#seats' do
    it 'should be accessible to admin'
    it 'should be accessible to customer if booking open'
    it 'should not be accessible to customer if it is past show'
  end
end