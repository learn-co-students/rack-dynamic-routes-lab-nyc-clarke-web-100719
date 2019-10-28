
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      str_item_name = req.path.split("/items/").last

      obj_item ||= @@items.find {|object| object.name == str_item_name}

      if !obj_item.nil?
        resp.write obj_item.price
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end

      # req.write "#{Item.all.each {|object| object.name == str_item_name}.map {|object| object.price}}"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end