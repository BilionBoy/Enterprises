require "test_helper"

class UsersEstabelecimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_estabelecimento = users_estabelecimentos(:one)
  end

  test "should get index" do
    get users_estabelecimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_user_estabelecimento_url
    assert_response :success
  end

  test "should create user_estabelecimento" do
    assert_difference("UserEstabelecimento.count") do
      post users_estabelecimentos_url, params: { user_estabelecimento: { estabelecimento_id: @user_estabelecimento.estabelecimento_id, user_id: @user_estabelecimento.user_id } }
    end

    assert_redirected_to user_estabelecimento_url(UserEstabelecimento.last)
  end

  test "should show user_estabelecimento" do
    get user_estabelecimento_url(@user_estabelecimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_estabelecimento_url(@user_estabelecimento)
    assert_response :success
  end

  test "should update user_estabelecimento" do
    patch user_estabelecimento_url(@user_estabelecimento), params: { user_estabelecimento: { estabelecimento_id: @user_estabelecimento.estabelecimento_id, user_id: @user_estabelecimento.user_id } }
    assert_redirected_to user_estabelecimento_url(@user_estabelecimento)
  end

  test "should destroy user_estabelecimento" do
    assert_difference("UserEstabelecimento.count", -1) do
      delete user_estabelecimento_url(@user_estabelecimento)
    end

    assert_redirected_to users_estabelecimentos_url
  end
end
