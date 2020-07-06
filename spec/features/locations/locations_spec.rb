require 'rails_helper'

RSpec.describe "users location", type: :feature do
  it "can enter the users current geographic coordinates" do
    visit "/locations/new"

    fill_in 'latitude', with: "39.742043"
    fill_in 'longitude', with: "-104.991531"

    click_button "Submit"

    location = UserLocation.last

    expect(current_path).to eq("/locations")
    expect(location.latitude).to eq("39.742043")
    expect(location.longitude).to eq("-104.991531")
    expect(location.city).to eq("Denver")
    expect(location.state).to eq("CO")
  end
end
