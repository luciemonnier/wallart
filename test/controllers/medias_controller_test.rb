require 'test_helper'

class MediasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medias_index_url
    assert_response :success
  end

  test "should get show" do
    get medias_show_url
    assert_response :success
  end

end
