require "application_system_test_case"

class UserEstabelecimentosTest < ApplicationSystemTestCase
  setup do
    @user_estabelecimento = users_estabelecimentos(:one)
  end

  test "visiting the index" do
    visit users_estabelecimentos_url
    assert_selector "h1", text: "User estabelecimentos"
  end

  test "should create user estabelecimento" do
    visit users_estabelecimentos_url
    click_on "New user estabelecimento"

    fill_in "Estabelecimento", with: @user_estabelecimento.estabelecimento_id
    fill_in "User", with: @user_estabelecimento.user_id
    click_on "Create User estabelecimento"

    assert_text "User estabelecimento was successfully created"
    click_on "Back"
  end

  test "should update User estabelecimento" do
    visit user_estabelecimento_url(@user_estabelecimento)
    click_on "Edit this user estabelecimento", match: :first

    fill_in "Estabelecimento", with: @user_estabelecimento.estabelecimento_id
    fill_in "User", with: @user_estabelecimento.user_id
    click_on "Update User estabelecimento"

    assert_text "User estabelecimento was successfully updated"
    click_on "Back"
  end

  test "should destroy User estabelecimento" do
    visit user_estabelecimento_url(@user_estabelecimento)
    click_on "Destroy this user estabelecimento", match: :first

    assert_text "User estabelecimento was successfully destroyed"
  end
end
