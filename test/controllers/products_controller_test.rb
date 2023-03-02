require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  #index test
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Prodcut.count, data.length
  end

  #show test
  test "show" do
    get "/products/#{Prodcut.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "image_url", "description", "created_at", "updated_at"], data.keys
    assert_equal true, data.keys.include?("name")
  end

  #create test

end
