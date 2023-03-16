require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # creating an admin user
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)

    # creating a session
    post "/sessions.json", params: { email: "test@test.com", password: "password" }

    # saving jwt to instance variable
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "tax", "total", "is_discounted?", "description", "inventory", "supplier", "images"], data.keys
  end

  test "create" do
    # testing a successful product create
    assert_difference "Product.count", 1 do
      post "/products.json",
           headers: { "Authorization" => "Bearer #{@jwt}" },
           params: { supplier_id: Supplier.first.id, name: "Lego Millennium Falcon", price: 800, description: "Defend the Galaxy and build the largest LEGO Star Wars Millennium Falcon to date! The perfect set for adult Star Wars fans and expert builders, This starship will inspire hours of play recreating the films or can be displayed as a collectible toy model" }
      assert_response 200
    end

    # testing validation failures
    post "/products.json",
         headers: { "Authorization" => "Bearer #{@jwt}" },
         params: {}
    assert_response 422

    # testing unauthorize user
    post "/products.json"
    assert_response 401
  end

  test "update" do
    #  testing successful update action
    product = Product.second
    patch "/products/#{product.id}.json",
          headers: { "Authorization" => "Bearer #{@jwt}" },
          params: { name: "Updated name" }

    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"].to_i
    assert_equal product.description, data["description"]

    # testing failed validations
    patch "/products/#{product.id}.json",
          headers: { "Authorization" => "Bearer #{@jwt}" },
          params: { name: "" }
    assert_response 422

    # testing unauthorized user
    patch "/products/#{product.id}.json"
    assert_response 401
  end

  test "destroy" do
    # testing successful destroy action
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    # testing unauthorized user
    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end
end
