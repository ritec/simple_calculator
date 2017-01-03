require 'rails_helper'

describe CalculatorsController do

  context "index" do

    it 'has a successful response' do
      get :index
      expect(response).to be_success
    end

  end

  context "calculate" do

    it 'has a successful response' do
      xhr :post, :calculate, {"calculators"=>{"value"=>""}}
      expect(response).to be_success
    end

    it 'correctly calculates simple valid input' do
      xhr :post, :calculate, {"calculators"=>{"value"=>"4+5"}}
      expect(assigns(:solution)).to eq(9.0)
    end

    it 'correctly calculates valid complicated input' do
      xhr :post, :calculate, {"calculators"=>{"value"=>"5*3+1+6/2+9*100"}}
      expect(assigns(:solution)).to eq(919.0)
      expect(assigns(:equation)).to eq("5*3+1+6/2+9*100")
    end

    it 'sets flash error message if input is invalid' do
      xhr :post, :calculate, {"calculators"=>{"value"=>"5*4^5a"}}
      expect(flash[:error]).to be_present
      expect(flash[:error]).to match("Please enter an equation using only +, -, /, * and digits.")
    end

  end

end
