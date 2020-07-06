require 'rails_helper'

RSpec.describe "users location", type: :feature do
  it "can enter the users current geographic coordinates" do
    visit "/locations/new"

    fill_in 'latitude', with: "39.3603"
    fill_in 'longitude', with: "104.5969"

    click_button "Submit"

    # location = Location.last
    # expect(location.latitude).to eq("39.3603")
    # expect(location.latitude).to eq("104.5969")
  end
end
