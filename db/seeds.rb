# Glow & Grace Beauty - Seed Data

categories = {
  "Skincare" => "Facial cleansers, moisturizers and serums",
  "Makeup" => "Lipsticks, foundations and makeup products",
  "Haircare" => "Shampoos, conditioners and hair treatments",
  "Body Care" => "Body lotions and personal care products",
  "Beauty Accessories" => "Brushes and beauty tools"
}

categories.each do |name, description|
  category = Category.find_or_initialize_by(name: name)
  category.description = description
  category.save!
end

products = [
  ["Hydrating Face Cleanser", "Gentle daily facial cleanser", 14.99, 30, "Skincare"],
  ["Vitamin C Serum", "Brightening facial serum", 24.99, 20, "Skincare"],
  ["Daily Moisturizer", "Hydrating face moisturizer", 18.99, 25, "Skincare"],
  ["Matte Lipstick", "Long-lasting matte lipstick", 12.99, 40, "Makeup"],
  ["Liquid Foundation", "Smooth coverage foundation", 22.99, 20, "Makeup"],
  ["Blush Palette", "Natural colour blush palette", 16.99, 15, "Makeup"],
  ["Repair Shampoo", "Nourishing hair shampoo", 15.99, 35, "Haircare"],
  ["Silky Conditioner", "Moisturizing hair conditioner", 15.99, 30, "Haircare"],
  ["Hair Repair Mask", "Deep conditioning hair mask", 19.99, 20, "Haircare"],
  ["Shea Body Lotion", "Softening body moisturizer", 13.99, 30, "Body Care"],
  ["Body Scrub", "Gentle exfoliating body scrub", 17.99, 25, "Body Care"],
  ["Hand Cream", "Moisturizing hand cream", 8.99, 40, "Body Care"],
  ["Makeup Brush Set", "Professional makeup brushes", 29.99, 15, "Beauty Accessories"],
  ["Beauty Blender", "Soft makeup blending sponge", 7.99, 50, "Beauty Accessories"],
  ["Facial Roller", "Relaxing facial massage roller", 14.99, 20, "Beauty Accessories"]
]

products.each do |name, description, price, stock, category_name|
  category = Category.find_by!(name: category_name)

  product = Product.find_or_initialize_by(name: name)
  product.description = description
  product.price = price
  product.stock_quantity = stock
  product.category = category
  product.active = true
  product.save!
end

puts "Seed data created successfully!"
puts "Categories: #{Category.count}"
puts "Products: #{Product.count}"