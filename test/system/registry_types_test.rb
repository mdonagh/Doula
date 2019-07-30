require "application_system_test_case"

class RegistryTypesTest < ApplicationSystemTestCase
  setup do
    @registry_type = registry_types(:one)
  end

  test "visiting the index" do
    visit registry_types_url
    assert_selector "h1", text: "Registry Types"
  end

  test "creating a Registry type" do
    visit registry_types_url
    click_on "New Registry Type"

    fill_in "Name", with: @registry_type.name
    click_on "Create Registry type"

    assert_text "Registry type was successfully created"
    click_on "Back"
  end

  test "updating a Registry type" do
    visit registry_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @registry_type.name
    click_on "Update Registry type"

    assert_text "Registry type was successfully updated"
    click_on "Back"
  end

  test "destroying a Registry type" do
    visit registry_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registry type was successfully destroyed"
  end
end
