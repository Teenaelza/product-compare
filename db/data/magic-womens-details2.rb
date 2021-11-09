
#loop over products to create product field
@magic_womens_clothing = []
womens.each do |product|
  productModel = {
    name: product["metadata"]["titleModule"]["product_title"], 
    description: product["metadata"]["titleModule"]["product_description"], 
    image: product["product_small_image_urls"]["string"][0], 
    price_cents: product["app_sale_price"], 
    rating: product["feedBackRating"]["averageStar"], 
    sale: product["discount_rate"] > 0, 
    url: product["product_detail_url"],
    website: "Ali Express"
  }
  #puts productModel[:name]
  @magic_womens_clothing.push(productModel)
  
end

#puts @magic_mens_clothing

@magic_womens_clothing_features = []
skuList = []
womens.each do |product|
 skuList.push(product["metadata"]["specsModule"]["props"])
end

#puts skuList[0]
i = 109
skuList.each do |product|
  #puts "new"
  magic_computer_obj = {product_id: i}
  product.each do |attribute|
    #puts "attr"
    
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
    if attribute["attrName"] == "ApplicableScene"
      magic_computer_obj["where"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "SleeveLength(cm)"
      magic_computer_obj["sleeveLength"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "ApplicableSeason"
      magic_computer_obj["season"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "FabricType"
      magic_computer_obj["fabric"] = attribute["attrValue"]
    end
    
    
  end
  i += 1
  @magic_womens_clothing_features.push(magic_computer_obj)
  
end

puts @magic_womens_clothing_features