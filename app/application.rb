require_relative "./item.rb"
class Application 
    

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/items/").last
            item_full = @@items.find {|i| i.name == item}
            if item_full
                resp.write item_full.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end



end