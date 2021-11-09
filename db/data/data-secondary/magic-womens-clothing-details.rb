
@magic_womens = []
womens.each do |product|
  productModel = {
    name: product["metadata"]["titleModule"]["product_title"], 
    description: product["metadata"]["titleModule"]["product_description"], 
    image: product["product_small_image_urls"]["string"][0], 
    price_cents: product["app_sale_price"], 
    rating: product["feedBackRating"]["averageStar"], 
    sale: product["discount_rate"] > 0, 
    url: product["product_detail_url"]
  }
  
  @magic_womens.push(productModel)
  
end

puts @magic_womens



skuList = []
womens.each do |product|
 skuList.push(product["metadata"]["specsModule"]["props"])
end

#puts skuList[0]
@magic_womens_features = []
skuList.each do |product|
  puts "new"
  magic_computer_obj = {}
  product.each do |attribute|
    puts "attr"
    
    if attribute["attrName"] == "ItemType"
      magic_computer_obj["type"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Colour"
      magic_computer_obj["color"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Material"
      magic_computer_obj["material"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "PatternType"
      magic_computer_obj["pattern"] = attribute["attrValue"]
    end
    
    
  end
  
  @magic_womens_features.push(magic_computer_obj)
  
end

puts @magic_womens_features