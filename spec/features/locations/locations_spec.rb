require 'rails_helper'

RSpec.describe "users location", type: :feature do
  it "can enter the users current geographic coordinates" do
    visit "/locations/new"

    fill_in 'latlong', with: "39.742043, -104.991531"

    click_button "Submit"

    location = Location.last

    expect(current_path).to eq("/locations/#{location.id}")
    expect(location.latitude).to eq("39.742043")
    expect(location.longitude).to eq("-104.991531")
    expect(location.city).to eq("Denver")
    expect(location.state).to eq("CO")

    expect(page).to have_content("Current Location: Denver, CO")
  end
end
