require 'rails_helper'

RSpec.describe "servers location", type: :feature do

  before :each do
    Location.delete_all
  end

  it "can enter two edge caches geographic coordinates" do
    visit "/servers/new"

    within "#locations" do
      # Pheonix, AZ
      fill_in 'server1', with: "33.448376, -112.074036"
      # Des Moines, IA
      fill_in 'server2', with: "41.619549, -93.598022"
    end

    click_button "Submit"

    expect(current_path).to eq("/results")
    expect(Location.all.count).to eq(2)
  end

  it "can get closest server location" do
    server1 = Location.create!({  name: "Server 1",
                                  latitude: "33.448376",
                                  longitude: "-112.074036",
                                  country: "US",
                                  state: "Arizona" })

    server2 = Location.create!({  name: "Server 2",
                                  latitude: "41.619549",
                                  longitude: "-93.598022",
                                  country: "US",
                                  state: "Iowa" })

    location = Location.create!({ name: "User's location",
                                  latitude: "32.779167",
                                  longitude: "-96.808891",
                                  country: "US",
                                  state: "Texas" })

    visit "/results"

    expect(page).to have_content("Closest Location: Arizona, US")
  end
end
