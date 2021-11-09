
@magic_computers_details = []
computers.each do |product|
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
  
  @magic_computers_details.push(productModel)
  
end

#puts @magic_computers_details

@magic_comp_features = []
skuList = []
computers.each do |product|
 skuList.push(product["metadata"]["specsModule"]["props"])
end

#puts skuList[0]
@magic_comp_features = []
i = 69
skuList.each do |product|
  #puts "new"
  magic_computer_obj = {product_id: i}
  product.each do |attribute|
    #puts "attr"
    
    if attribute["attrName"] == "Type"
      magic_computer_obj["type"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Colour"
      magic_computer_obj["color"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Material"
      magic_computer_obj["material"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "BrandName"
      magic_computer_obj["brand"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "DisplaySize"
      magic_computer_obj["screenSize"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "HardDriveCapacity"
      magic_computer_obj["storage"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Weight(BatteryIncluded)"
      magic_computer_obj["weight"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "OperatingSystem"
      magic_computer_obj["operatingSystem"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "RAM"
      magic_computer_obj["RAM"] = attribute["attrValue"]
    end
    if attribute["attrName"] == "Displayresolution"
      magic_computer_obj["resolution"] = attribute["attrValue"]
    end
    
  end
  i += 1
  @magic_comp_features.push(magic_computer_obj)
  
end

puts @magic_comp_features