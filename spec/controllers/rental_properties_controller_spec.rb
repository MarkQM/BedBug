require 'rails_helper'

RSpec.describe RentalPropertiesController, type: :controller do
    context "root route" do
        it "routes to rental_properties#index" do
            expect(:get => '/').to route_to(:controller => 'rental_properties', :action => 'index')
        end
    end

    context "index" do
        it "routes correctly" do
            get :index
            expect(response.status).to eq(200)
        end

        it "renders the index template and does default sorting" do
            x, y = RentalProperty.create!, RentalProperty.create!
            get :index
            expect(assigns(:properties)).to match_array([x,y])
            expect(response).to render_template("index")
        end
    end

    context "show" do
        it "routes correctly" do
            p = RentalProperty.new(title: "Pwll o le")
            expect(RentalProperty).to receive(:find).with("1") { p }
            get :show, :params => { :id => 1 }
            expect(response.status).to eq(200)
        end

        it "renders the show template" do
            p = RentalProperty.new(title: "Pwll o le")
            expect(RentalProperty).to receive(:find).with("1") { p }
            get :show, :params => { :id => 1 }
            expect(response).to render_template("show")
            expect(assigns(:property)).to eq(p)
        end
    end
end
