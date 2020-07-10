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

    location = Location.find_by(latitude: "39.742043")
    server1 = Location.find_by(latitude: "33.448376")
    server2 = Location.find_by(latitude: "41.619549")

    expect(current_path).to eq("/results/#{location.id}/servers/#{server1.id}/#{server2.id}")
    expect(Location.all.count).to eq(3)

    expect(page).to have_content("Closest Server: Arizona, US")
  end

  it "can get the RTT to the closest server" do
    visit "/locations/new"

    within '#location' do
      fill_in 'latlong', with: "39.742043, -104.991531"
      # Pheonix, AZ
      fill_in 'server1', with: "33.448376, -112.074036"
      # Des Moines, IA
      fill_in 'server2', with: "41.619549, -93.598022"
    end

    click_button "Submit"

    location = Location.find_by(latitude: "39.742043")
    server1 = Location.find_by(latitude: "33.448376")
    server2 = Location.find_by(latitude: "41.619549")

    expect(current_path).to eq("/results/#{location.id}/servers/#{server1.id}/#{server2.id}")
    expect(page).to have_content("Round Trip Time: About 6.45e-06 milliseconds")
  end

  it "can get the maximum bandwith given a 10MB delay" do
    visit "/locations/new"

    within '#location' do
      # Denver, CO
      fill_in 'latlong', with: "39.742043, -104.991531"
      # Pheonix, AZ
      fill_in 'server1', with: "33.448376, -112.074036"
      # Des Moines, IA
      fill_in 'server2', with: "41.619549, -93.598022"
    end

    click_button "Submit"

    location = Location.find_by(latitude: "39.742043")
    server1 = Location.find_by(latitude: "33.448376")
    server2 = Location.find_by(latitude: "41.619549")

    expect(current_path).to eq("/results/#{location.id}/servers/#{server1.id}/#{server2.id}")
    expect(page).to have_content("Maximum Bandwidth: About 0.0645 bits")
  end
end
