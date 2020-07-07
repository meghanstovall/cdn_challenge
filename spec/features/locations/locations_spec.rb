require 'rails_helper'

RSpec.describe "users location", type: :feature do

  before :each do
    Location.delete_all
  end

  it "can enter the users geographic coordinates and two edge caches geographic coordinates" do
    visit "/locations/new"

    within '#location' do
      fill_in 'latlong', with: "39.742043, -104.991531"
      # Pheonix, AZ
      fill_in 'server1', with: "33.448376, -112.074036"
      # Des Moines, IA
      fill_in 'server2', with: "41.619549, -93.598022"
    end

    click_button "Submit"

    location = Location.last

    expect(current_path).to eq("/results")
    expect(Location.all.count).to eq(3)

    expect(page).to have_content("Closest Server: Arizona, US")
  end
end
