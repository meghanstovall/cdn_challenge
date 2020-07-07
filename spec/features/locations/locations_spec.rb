require 'rails_helper'

RSpec.describe "users location", type: :feature do

  before :each do
    Location.delete_all
  end
  
  it "can enter the users geographic coordinates and two edge caches geographic coordinates" do
    visit "/locations/new"

    within '#location' do
      fill_in 'latlong', with: "39.742043, -104.991531"
    end

    click_button "Submit"

    location = Location.last

    expect(current_path).to eq("/locations/#{location.id}")
    expect(location.latitude).to eq("39.742043")
    expect(location.longitude).to eq("-104.991531")
    expect(location.country).to eq("US")
    expect(location.state).to eq("Colorado")

    expect(page).to have_content("Current Location: Colorado, US")

    click_on "Enter Server Locations"
    expect(current_path).to eq("/servers/new")
  end
end
