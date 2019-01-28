class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/")[-1]
      item = @@items.find { |i| i.name == item_name }

      if item
        resp.status = 200
        resp.write item.price

      else
        resp.status = 400
        resp.write "Item not found"
      end # end of "if item"

    else
      resp.write "Route not found"
      resp.status = 404
    end # end of "if req.path"

    resp.finish
  end # end of "def call(env)"
end # end of "class Application"
