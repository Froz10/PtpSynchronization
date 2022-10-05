require "rails_helper"

RSpec.describe "Api::Configurations", type: :request do

  describe "#create" do
    let(:headers) do
      { "ACCEPT" => "application/json" }
    end
    let(:region) { create(:region, name: "Region") }
    let(:address) { "109.124.241.43" }
    let(:name) { "VO000119-CSG01" }
    let(:host) { create(:host, region: region, address: address, name: name) }

    context "host exists" do
      it "is successful" do
        post "/api/configurations", params: { name: host.name }, headers: headers
        expect(response).to be_successful
      end
    end

    context "host does not exist" do
      it "is not found" do
        post "/api/configurations", params: { name: "junkname" }, headers: headers
        expect(response.status).to eq 404
      end
    end
  end
end