require 'pry'


#### CLASS instance variable

# class Application
#   @config = {}

#   def self.set(property, value)
#     @config[property] = value
#   end

#   def self.get(property)
#     @config[property]
#   end
# end

# class ERPApp < Application
#   @config = {}
# end

# class WebApp < Application
#   @config = {}
# end


# if __FILE__ == $PROGRAM_NAME
#     ERPApp.set("name", "erp app")
#     WebApp.set("name", "web app")
#     binding.pry
#     p ERPApp.get("name")
#     p WebApp.get("name")
# end


#### EQUALITY OF Object

# class Item
#   attr_reader :item_name, :qty
#   def initialize(item_name, qty)
#       @item_name = item_name
#       @qty = qty
#   end

#   def to_s
#     "name: #{@item_name} -- quantity: #{@qty} "
#   end

#   def hash
#     @item_name.hash ^ @qty.hash
#   end

#   def eql?(other)
#     p "equal invoke!"
#     @item_name == other.item_name && @qty == other.qty
#   end
# end

# p Item.new("abcd",1)  == Item.new("abcd",1)
# p Item.new("abcd", 1).hash

# items = [Item.new("abcd", 1), Item.new("abcd", 1), Item.new("abcd", 1)]
# puts items.uniq

# def ==(other); end
# def eql?(other); self == other; end
# def hash; ^  ^ ^ ; end
