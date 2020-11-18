require 'test_helper'

class FaucetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faucet_index_url
    assert_response :success
  end

end
