require 'spec_helper'

describe Api::V1::BusinessesController do
  before(:each) { request.headers['Accept'] = "application/vnd.ownlocalbusiness.v1" }

  describe "GET #show" do
    before(:each) do
      @business = FactoryGirl.create :business
      get :show, id: @business.id, format: :json
    end

    it "returns the businesses information in json" do
      business_response = JSON.parse(response.body, symbolize_names: true)
      expect(business_response[:uuid]).to eql '2859d6e0-1cb9-4fe9-bc00-97823a9fa4cb'
    end

    it { expect(response.status).to eql 200 }
  end

  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :business } 
      get :index
    end

    it "returns 4 records from the database" do
      business_response = JSON.parse(response.body, symbolize_names: true)
      expect(business_response[:businesses].count).to eq 4
    end

    # # we added this lines for the pagination
    
    it "returns the following meta data" do
      business_response = JSON.parse(response.body, symbolize_names: true)
      expect(business_response).to have_key(:meta)
      expect(business_response[:meta]).to have_key(:pagination)
      expect(business_response[:meta][:pagination]).to have_key(:per_page)
      expect(business_response[:meta][:pagination]).to have_key(:total_pages) 
      expect(business_response[:meta][:pagination]).to have_key(:total_objects)

    end

    it { expect(response.status).to eql 200 }
  end
end