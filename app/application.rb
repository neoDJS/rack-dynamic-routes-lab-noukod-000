class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/*").last #turn /items/Sorry into Sorry
      item = @@items.find{|i| i.name == item_name}
      if item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write item.price
      end
    else
      resp.write "Path Not Found"
      resp.status = 404
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end

  def handle_add(cart_item)
    if @@items.include?(cart_item)
      @@cart << cart_item
<<<<<<< HEAD
      return "added #{cart_item}"
    else
      return "We don't have that item"
=======
      return "#{cart_item} is added to your cart"
    else
      return "Couldn't find #{cart_item}"
>>>>>>> 2770e4a091fe8ae67ae79201c58f61595bdac3e4
    end
  end
end
