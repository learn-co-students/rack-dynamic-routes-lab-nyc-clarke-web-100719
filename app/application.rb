class Application

    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new
        if req.path.match(/items/)
            req_item = req.path.split("/items/").last
            if req_item = @@items.find{|item| item.name == req_item}
            resp.write req_item.price
            else
            resp.status = 400
            resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end

        resp.finish
    end

end