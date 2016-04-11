require 'spec_helper'

describe Api::V1::BusinessesController do
  before(:each) { request.headers['Accept'] = "application/vnd.ownlocalbusiness.v1" }

  describe "GET #show" do
    before(:each) do
      @business = FactoryGirl.create :business
      get :show, id: @business.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end
end