
@target_womens = []
womens.each do |product|
  productModel = {
    name: product["data"]["product"]["item"]["product_description"]["title"], 
    description: product["data"]["product"]["item"]["product_description"]["bullet_descriptions"].to_s, 
    image: product["data"]["product"]["item"]["enrichment"]["images"]["primary_image_url"], 
    price_cents: product["data"]["product"]["price"]["current_retail_max"], 
    rating: product["data"]["product"]["ratings_and_reviews"]["statistics"]["rating"]["average"], 
    sale: product["data"]["product"]["price"]["formatted_current_price_type"] === "sale", 
    url: product["data"]["product"]["item"]["enrichment"]["buy_url"]
  }
  
  @target_womens.push(productModel)
end

puts @target_womens

@target_womens_features = []
womens.each do |product|
  
  @target_womens_features.push(product["data"]["product"]["item"]["merchandise_type_attributes"]) 

end


@target_womens_array = []

@target_womens_features.each do |product|
  target_elec_object = {}
  product.each do |attribute|
    
    if attribute["name"] == "Color Family"
      values = attribute["values"][0]
      target_elec_object["color"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Fabric Weight Type"
      values = attribute["values"][0]
      target_elec_object["weightType"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Pattern"
      values = attribute["values"][0]
      target_elec_object["pattern"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Item Type"
      values = attribute["values"][0]
      target_elec_object["type"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Targeted Audience"
      values = attribute["values"][0]
      target_elec_object["audience"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Sheerness level"
      values = attribute["values"][0]
      target_elec_object["sheerness"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Apparel material 1"
      values = attribute["values"][0]
      target_elec_object["material1"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Apparel material 2"
      values = attribute["values"][0]
      target_elec_object["material2"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Apparel material 3"
      values = attribute["values"][0]
      target_elec_object["material3"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Apparel material 4"
      values = attribute["values"][0]
      target_elec_object["material4"] = values["name"]
      @target_womens_array.push(target_elec_object)
    end
    if attribute["name"] == "Textile wash recommendation"
      values = attribute["values"][0]
      target_elec_object["machineWash"] = (values["name"] == "Machine Wash")
      
    end
    
  end
  @target_womens_array.push(target_elec_object)
end

puts @target_womens_array