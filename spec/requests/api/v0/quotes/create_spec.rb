RSpec.describe "POST /api/v0/quotes", type: :request do
  describe "successfully" do
    describe "when the vehicle is bicycle" do
      before { post "/api/v0/quotes", params: { from: "EC2A 3LT", to: "NW8 8TE", vehicle: "bicycle" } }

      it "with 200 status" do
        expect(response.status).to eq 200
      end

      it "with correct fields in the response" do
        expect(json_response).to include("from", "to", "vehicle", "cost")
      end

      it "with correct from field in the response" do
        expect(json_response["from"]).to eq("EC2A 3LT")
      end

      it "with correct to field in the response" do
        expect(json_response["to"]).to eq("NW8 8TE")
      end

      it "with correct vehicle field in the response" do
        expect(json_response["vehicle"]).to eq("bicycle")
      end

      it "with correct cost estimation field in the response" do
        expect(json_response["cost"]).to eq(0.64)
      end
    end

    describe "when the vehicle is small_car" do
      before { post "/api/v0/quotes", params: { from: "EC2A 3LT", to: "NW8 8TE", vehicle: "small_car" } }

      it "with 200 status" do
        expect(response.status).to eq 200
      end

      it "with correct fields in the response" do
        expect(json_response).to include("from", "to", "vehicle", "cost")
      end

      it "with correct from field in the response" do
        expect(json_response["from"]).to eq("EC2A 3LT")
      end

      it "with correct to field in the response" do
        expect(json_response["to"]).to eq("NW8 8TE")
      end

      it "with correct vehicle field in the response" do
        expect(json_response["vehicle"]).to eq("small_car")
      end

      it "with correct cost estimation field in the response" do
        expect(json_response["cost"]).to eq(0.8)
      end
    end

    describe "when the vehicle is van" do
      before { post "/api/v0/quotes", params: { from: "EC2A 3LT", to: "NW8 8TE", vehicle: "van" } }

      it "with 200 status" do
        expect(response.status).to eq 200
      end

      it "with correct fields in the response" do
        expect(json_response).to include("from", "to", "vehicle", "cost")
      end

      it "with correct from field in the response" do
        expect(json_response["from"]).to eq("EC2A 3LT")
      end

      it "with correct to field in the response" do
        expect(json_response["to"]).to eq("NW8 8TE")
      end

      it "with correct vehicle field in the response" do
        expect(json_response["vehicle"]).to eq("van")
      end

      it "with correct cost estimation field in the response" do
        expect(json_response["cost"]).to eq(0.96)
      end
    end

    describe "when the vehicle is lorry" do
      before { post "/api/v0/quotes", params: { from: "EC2A 3LT", to: "NW8 8TE", vehicle: "lorry" } }

      it "with 200 status" do
        expect(response.status).to eq 200
      end

      it "with correct fields in the response" do
        expect(json_response).to include("from", "to", "vehicle", "cost")
      end

      it "with correct from field in the response" do
        expect(json_response["from"]).to eq("EC2A 3LT")
      end

      it "with correct to field in the response" do
        expect(json_response["to"]).to eq("NW8 8TE")
      end

      it "with correct vehicle field in the response" do
        expect(json_response["vehicle"]).to eq("lorry")
      end

      it "with correct cost estimation field in the response" do
        expect(json_response["cost"]).to eq(1.28)
      end
    end

    describe "when the vehicle is none of the above" do
      before { post "/api/v0/quotes", params: { from: "EC2A 3LT", to: "NW8 8TE", vehicle: "plane" } }

      it "with 200 status" do
        expect(response.status).to eq 200
      end

      it "with correct fields in the response" do
        expect(json_response).to include("from", "to", "vehicle", "cost")
      end

      it "with correct from field in the response" do
        expect(json_response["from"]).to eq("EC2A 3LT")
      end

      it "with correct to field in the response" do
        expect(json_response["to"]).to eq("NW8 8TE")
      end

      it "with correct vehicle field in the response" do
        expect(json_response["vehicle"]).to eq("plane")
      end

      it "with correct cost estimation field in the response" do
        expect(json_response["cost"]).to eq(
          "For the type of transport: plane, please speak with one of our representatives."
        )
      end
    end
  end

  describe "unsuccesfully" do
    describe "when no params are passed" do
      before { post "/api/v0/quotes" }

      it "with 400 status" do
        expect(response.status).to eq 400
      end

      it "with correct number of error messages" do
        expect(json_response["errors"].count).to eq 1
      end

      it "with correct error message" do
        expect(
          json_response["errors"].first
        ).to eq "Both FROM and TO postcodes and a VEHICLE type needed to calculate a cost!"
      end
    end
  end
end
