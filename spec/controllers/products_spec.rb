require 'spec_helper'
require 'rails_helper'
RSpec.describe ProductsController, type: :request do
  before(:each) do
    @product = FactoryBot.create(:product)
  end

  describe 'post#create' do
    
    it'create new post'do
      post '/products', params:{product: {name: "test product", description:"demo test", price:30}} 
      expect(response.status).to eq 302
    end

  end

end