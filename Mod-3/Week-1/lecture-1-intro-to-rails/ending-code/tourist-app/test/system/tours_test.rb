require "application_system_test_case"

class ToursTest < ApplicationSystemTestCase
  setup do
    @tour = tours(:one)
  end

  test "visiting the index" do
    visit tours_url
    assert_selector "h1", text: "Tours"
  end

  test "creating a Tour" do
    visit tours_url
    click_on "New Tour"

    fill_in "Activities", with: @tour.activities
    fill_in "Cost", with: @tour.cost
    fill_in "End time", with: @tour.end_time
    check "Full" if @tour.full
    fill_in "Location", with: @tour.location
    fill_in "Name", with: @tour.name
    fill_in "Start time", with: @tour.start_time
    fill_in "Tour date", with: @tour.tour_date
    click_on "Create Tour"

    assert_text "Tour was successfully created"
    click_on "Back"
  end

  test "updating a Tour" do
    visit tours_url
    click_on "Edit", match: :first

    fill_in "Activities", with: @tour.activities
    fill_in "Cost", with: @tour.cost
    fill_in "End time", with: @tour.end_time
    check "Full" if @tour.full
    fill_in "Location", with: @tour.location
    fill_in "Name", with: @tour.name
    fill_in "Start time", with: @tour.start_time
    fill_in "Tour date", with: @tour.tour_date
    click_on "Update Tour"

    assert_text "Tour was successfully updated"
    click_on "Back"
  end

  test "destroying a Tour" do
    visit tours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tour was successfully destroyed"
  end
end
