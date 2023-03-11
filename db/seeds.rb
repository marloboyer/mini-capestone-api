Product.create!([
  { name: "Water", price: 5, description: "wet wet wet wet", supplier_id: 1 },
  { name: "Tea", price: 5, description: "water with flavor", supplier_id: 2 },
  { name: "Ice Cream", price: 3, description: "Frozen milk with flavoring", supplier_id: 2 },
  { name: "Gatorade", price: 5, image_url: "ldfa", description: "water with flavor", supplier_id: 3 },
])

Supplier.create!([
  { name: "Ozarka", email: "jfd@local.net", phone_number: "123-342-3224" },
  { name: "PeaceTea", email: "peacetea@local.net", phone_number: "342-324-3243" },
  { name: "Bluebell", email: "bluebelll@local.net", phone_number: "212-323-4278" },
])

Image.create!([
  { url: "https://www.treehugger.com/thmb/Td6BxnyicFhf_Hst3i0dhTZmMss=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/closeupbrightbluewater-61f0f88d81004729a7385484bcd38998.jpg", product_id: 1 },
  { url: "https://www.foodandwine.com/thmb/6wTm7a0y87X97LK-ZMxe2787kI8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/different-types-of-tea-FT-BLOG0621-7c7fd231e66d4fea8ca9a47cad52ba79.jpg", product_id: 2 },
  { url: "https://joyfoodsunshine.com/wp-content/uploads/2020/06/homemade-chocolate-ice-cream-recipe-7.jpg", product_id: 3 },

])
