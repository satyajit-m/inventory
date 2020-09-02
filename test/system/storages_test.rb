require "application_system_test_case"

class StoragesTest < ApplicationSystemTestCase
  setup do
    @storage = storages(:one)
  end

  test "visiting the index" do
    visit storages_url
    assert_selector "h1", text: "Storages"
  end

  test "creating a Storage" do
    visit storages_url
    click_on "New Storage"

    fill_in "Buffer", with: @storage.buffer
    fill_in "Item", with: @storage.item_id
    fill_in "Procure time", with: @storage.procure_time
    fill_in "Qty", with: @storage.qty
    click_on "Create Storage"

    assert_text "Storage was successfully created"
    click_on "Back"
  end

  test "updating a Storage" do
    visit storages_url
    click_on "Edit", match: :first

    fill_in "Buffer", with: @storage.buffer
    fill_in "Item", with: @storage.item_id
    fill_in "Procure time", with: @storage.procure_time
    fill_in "Qty", with: @storage.qty
    click_on "Update Storage"

    assert_text "Storage was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage" do
    visit storages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage was successfully destroyed"
  end
end
