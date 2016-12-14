

class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


if req.path.match(/items/)
  search_term = req.path.split("/items/").last
  price = item_price(search_term)
  if price != false
    resp.write "#{price}"
  else
    resp.status = 400
    resp.write "Item not found"
  end
else
  resp.status=404
  resp.write "Route not found"

end
resp.finish
end



def item_price(search_term)
  @@items.find do |item|
    if item.name == search_term
      return item.price
    end
  end
  false
end
end
