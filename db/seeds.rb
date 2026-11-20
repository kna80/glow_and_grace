# Glow & Grace Beauty - Seed Data
# 105 realistic beauty products across 5 categories

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

products = {
  "Skincare" => [
    ["Hydrating Face Cleanser", "Gentle daily facial cleanser", 14.99],
    ["Vitamin C Serum", "Brightening facial serum", 24.99],
    ["Daily Moisturizer", "Hydrating face moisturizer", 18.99],
    ["Hyaluronic Acid Serum", "Hydrating serum for dry skin", 21.99],
    ["Niacinamide Serum", "Serum designed to improve uneven skin tone", 19.99],
    ["Aloe Vera Gel", "Cooling and soothing aloe vera gel", 12.99],
    ["Rose Water Toner", "Refreshing facial toner with rose water", 13.99],
    ["Gentle Exfoliating Scrub", "Mild facial exfoliating scrub", 16.99],
    ["Clay Face Mask", "Purifying clay mask for oily skin", 18.99],
    ["Night Repair Cream", "Rich moisturizing night cream", 26.99],
    ["SPF 50 Sunscreen", "Daily broad-spectrum sun protection", 22.99],
    ["Under Eye Cream", "Hydrating cream for the delicate eye area", 20.99],
    ["Micellar Cleansing Water", "Gentle makeup-removing cleansing water", 11.99],
    ["Green Tea Face Wash", "Refreshing facial cleanser with green tea", 15.99],
    ["Brightening Face Mask", "Facial mask for a radiant appearance", 17.99],
    ["Peptide Face Serum", "Lightweight peptide facial serum", 29.99],
    ["Ceramide Moisturizer", "Barrier-supporting facial moisturizer", 25.99],
    ["Lip Sleeping Mask", "Overnight moisturizing lip treatment", 14.99],
    ["Facial Cleansing Balm", "Gentle balm for removing makeup", 23.99],
    ["Hydrating Sheet Mask", "Moisture-rich single-use facial sheet mask", 6.99],
    ["Retinol Night Serum", "Evening facial serum containing retinol", 28.99]
  ],

  "Makeup" => [
    ["Matte Lipstick", "Long-lasting matte lipstick", 12.99],
    ["Liquid Foundation", "Smooth coverage foundation", 22.99],
    ["Blush Palette", "Natural colour blush palette", 16.99],
    ["Cream Concealer", "Blendable concealer for a smooth finish", 14.99],
    ["Waterproof Mascara", "Long-lasting waterproof mascara", 17.99],
    ["Liquid Eyeliner", "Precision liquid eyeliner", 12.99],
    ["Eyeshadow Palette", "Versatile eyeshadow palette with neutral shades", 29.99],
    ["Setting Powder", "Lightweight powder for setting makeup", 18.99],
    ["Makeup Setting Spray", "Refreshing spray to help set makeup", 16.99],
    ["Lip Gloss", "Shiny moisturizing lip gloss", 10.99],
    ["Brow Pencil", "Precision eyebrow defining pencil", 9.99],
    ["Cream Blush", "Blendable cream blush for natural colour", 15.99],
    ["Highlighter Palette", "Illuminating powder highlighter palette", 21.99],
    ["BB Cream", "Lightweight tinted beauty cream", 19.99],
    ["Lip Liner", "Smooth lip-defining pencil", 8.99],
    ["Contour Stick", "Cream contour stick for face definition", 17.99],
    ["Primer Gel", "Lightweight gel primer for makeup preparation", 20.99],
    ["Powder Foundation", "Pressed powder foundation with buildable coverage", 24.99],
    ["Tinted Lip Balm", "Moisturizing lip balm with a soft tint", 7.99],
    ["Brow Gel", "Clear styling gel for eyebrows", 13.99],
    ["Makeup Colour Corrector", "Colour correcting cream palette", 18.99]
  ],

  "Haircare" => [
    ["Repair Shampoo", "Nourishing hair shampoo", 15.99],
    ["Silky Conditioner", "Moisturizing hair conditioner", 15.99],
    ["Hair Repair Mask", "Deep conditioning hair mask", 19.99],
    ["Argan Hair Oil", "Lightweight nourishing argan hair oil", 18.99],
    ["Keratin Shampoo", "Smoothing shampoo with keratin", 17.99],
    ["Keratin Conditioner", "Conditioner for smooth manageable hair", 17.99],
    ["Scalp Scrub", "Exfoliating scalp treatment", 20.99],
    ["Leave In Conditioner", "Detangling leave-in conditioning spray", 16.99],
    ["Heat Protection Spray", "Protective spray for heat styling", 14.99],
    ["Curl Defining Cream", "Styling cream for defined curls", 19.99],
    ["Dry Shampoo", "Refreshing dry shampoo for busy days", 12.99],
    ["Hair Growth Scalp Serum", "Scalp care serum for healthy-looking hair", 27.99],
    ["Coconut Hair Mask", "Deep moisturizing coconut hair treatment", 18.99],
    ["Purple Shampoo", "Toning shampoo for blonde hair", 21.99],
    ["Anti Frizz Serum", "Smoothing serum for frizz control", 16.99],
    ["Hair Styling Mousse", "Lightweight mousse for volume and styling", 13.99],
    ["Hair Shine Spray", "Finishing spray for glossy-looking hair", 14.99],
    ["Rosemary Scalp Oil", "Rosemary-infused scalp massage oil", 19.99],
    ["Detangling Spray", "Gentle spray for easier hair brushing", 11.99],
    ["Volumizing Shampoo", "Shampoo for fuller-looking hair", 17.99],
    ["Hair Finishing Cream", "Lightweight cream for smooth hairstyles", 15.99]
  ],

  "Body Care" => [
    ["Shea Body Lotion", "Softening body moisturizer", 13.99],
    ["Body Scrub", "Gentle exfoliating body scrub", 17.99],
    ["Hand Cream", "Moisturizing hand cream", 8.99],
    ["Coconut Body Butter", "Rich coconut body moisturizer", 19.99],
    ["Lavender Body Wash", "Relaxing lavender scented body wash", 12.99],
    ["Rose Body Mist", "Light floral body fragrance mist", 15.99],
    ["Vanilla Body Lotion", "Moisturizing lotion with vanilla fragrance", 14.99],
    ["Foot Repair Cream", "Rich moisturizing cream for dry feet", 11.99],
    ["Sugar Body Scrub", "Exfoliating sugar-based body scrub", 16.99],
    ["Aloe Body Gel", "Cooling aloe vera body gel", 13.99],
    ["Body Massage Oil", "Smooth moisturizing body massage oil", 20.99],
    ["Hand Wash", "Gentle liquid hand cleanser", 7.99],
    ["Bath Salts", "Relaxing scented bath salts", 14.99],
    ["Body Exfoliating Polish", "Creamy body exfoliating polish", 18.99],
    ["Cocoa Body Butter", "Rich cocoa-scented body moisturizer", 19.99],
    ["Refreshing Shower Gel", "Refreshing daily shower cleanser", 11.99],
    ["Body Hydrating Serum", "Lightweight hydrating body serum", 22.99],
    ["Cuticle Oil", "Nourishing oil for nails and cuticles", 9.99],
    ["Heel Balm", "Intensive moisturizing heel balm", 12.99],
    ["Body Moisture Cream", "Daily moisturizing body cream", 15.99],
    ["Hand and Nail Lotion", "Moisturizing lotion for hands and nails", 10.99]
  ],

  "Beauty Accessories" => [
    ["Makeup Brush Set", "Professional makeup brushes", 29.99],
    ["Beauty Blender", "Soft makeup blending sponge", 7.99],
    ["Facial Roller", "Relaxing facial massage roller", 14.99],
    ["Jade Gua Sha Tool", "Smooth facial massage tool", 12.99],
    ["Eyelash Curler", "Comfortable eyelash curling tool", 9.99],
    ["Makeup Organizer", "Compact organizer for beauty essentials", 24.99],
    ["Hair Claw Clips", "Durable hair styling claw clips", 8.99],
    ["Satin Hair Scrunchies", "Soft satin hair scrunchie set", 9.99],
    ["Facial Cleansing Brush", "Soft facial cleansing brush", 14.99],
    ["Reusable Makeup Pads", "Washable reusable makeup removal pads", 11.99],
    ["Precision Tweezers", "Stainless steel eyebrow tweezers", 7.99],
    ["Makeup Mirror", "Portable tabletop makeup mirror", 19.99],
    ["Nail Care Kit", "Essential manicure and nail care tools", 17.99],
    ["Hair Detangling Brush", "Gentle detangling hair brush", 13.99],
    ["Silicone Face Mask Brush", "Reusable silicone facial mask applicator", 6.99],
    ["Travel Makeup Bag", "Compact travel cosmetic storage bag", 16.99],
    ["Hair Styling Comb Set", "Professional hair styling comb collection", 12.99],
    ["Makeup Sponge Holder", "Ventilated makeup sponge storage holder", 8.99],
    ["Facial Headband", "Soft headband for skincare routines", 7.99],
    ["Nail Buffer Set", "Nail shaping and polishing buffer set", 6.99],
    ["Compact Brush Cleaner", "Silicone makeup brush cleaning mat", 10.99]
  ]
}

products.each do |category_name, items|
  category = Category.find_by!(name: category_name)

  items.each do |name, description, price|
    product = Product.find_or_initialize_by(name: name)

    if product.new_record?
      product.description = description
      product.price = price
      product.stock_quantity = 30
      product.category = category
      product.active = true
      product.save!
    end
  end
end

if Rails.env.development?
  AdminUser.find_or_create_by!(email: "admin@example.com") do |admin|
    admin.password = "password"
    admin.password_confirmation = "password"
  end
end

puts "Glow & Grace seed data created successfully!"
puts "Categories: #{Category.count}"
puts "Products: #{Product.count}"
# Canadian Provinces and Territories - Tax Rates
# Rates are percentages, e.g. 5.0 means 5%.

province_taxes = [
  ["Alberta", "AB", 5.0, 0.0, 0.0],
  ["British Columbia", "BC", 5.0, 7.0, 0.0],
  ["Manitoba", "MB", 5.0, 7.0, 0.0],
  ["New Brunswick", "NB", 0.0, 0.0, 15.0],
  ["Newfoundland and Labrador", "NL", 0.0, 0.0, 15.0],
  ["Northwest Territories", "NT", 5.0, 0.0, 0.0],
  ["Nova Scotia", "NS", 0.0, 0.0, 14.0],
  ["Nunavut", "NU", 5.0, 0.0, 0.0],
  ["Ontario", "ON", 0.0, 0.0, 13.0],
  ["Prince Edward Island", "PE", 0.0, 0.0, 15.0],
  ["Quebec", "QC", 5.0, 9.975, 0.0],
  ["Saskatchewan", "SK", 5.0, 6.0, 0.0],
  ["Yukon", "YT", 5.0, 0.0, 0.0]
]

province_taxes.each do |name, code, gst, pst, hst|
  province = Province.find_or_initialize_by(code: code)

  province.name = name
  province.gst_rate = gst
  province.pst_rate = pst
  province.hst_rate = hst

  province.save!
end

puts "Canadian provinces created: #{Province.count}"
