class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_exists = Item.all.find do|item|
        item.name == item_name
        end
        if item_exists
          item = Item.all.find do|item|
            item.name == item_name
            resp.write item.price
          end
        else
          resp.status = 400
          resp.write "Item not found"
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end

    # if req.path=="/songs/Sorry"
    #   resp.write @@songs[0].artist
    # elsif req.path == "/songs/Hello"
    #   resp.write @@songs[1].artist
    # end
