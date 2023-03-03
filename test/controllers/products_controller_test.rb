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
  test "create" do
    assert_difference "Prodcut.count", 1 do
      post "/products.json", params: { name: "test product", price: 1, image_url: "gnkf", description: "test description" }
      assert_response 200
    end
  end

  #update test
  test "update" do
    product = Prodcut.first
    patch "/products/#{product.id}.json", params: { name: "Water", price: 100 }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Water", data["name"]
    assert_equal 100, data["price"]
  end

  #destroy test
  test "destroy" do
    assert_difference "Prodcut.count", -1 do
      delete "/products/#{Prodcut.first.id}.json"
      assert_response 200
    end
  end
end
