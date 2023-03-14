require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  #index test
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  #show test
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "tax", "total", "description", "inventory", "supplier", "is_discounted?", "images"], data.keys
    assert_equal true, data.keys.include?("name")
  end

  #create test
  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "test product", price: 1, description: "test description" }
      assert_response 200
    end
    post "/products.json", params { }
    assert_response 422
  end

  #update test
  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Update name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Update name", data["name"]
    assert_equal product.price, data["price"].to_i
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  #destroy test
  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
