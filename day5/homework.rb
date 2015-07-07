class Product
	def initialize(name,price,brand)
		@name=name
		@price=price
		@brand=brand
	end
	attr_reader :name, :price, :brand
	def to_s
		"Name: #{@name}\nPrice: #{@price}\nBrand: #{@brand}\n\n"
	end
end

class ProductCollection
	def initialize(products_array)
		@products=products_array.map do |product|
			Product.new(product[:name],product[:price],product[:brand])
		end
	end

	def count
		@products.count
	end
	def get_names
		@products.map do |element|
			element.name
		end
	end
	def filter_by_brand(brand)
		@products.select do |product|
		  product.brand==brand		
		end	
	end
	def count_by_brand(brand)
		filter_by_brand(brand).count
	end
	def group_by_brand
		@products.group_by do |product|
			product.brand
		end
	end
	def cheapest
		@products.min_by do |element|
			element.price
		end
		
	end
	def most_expensive
		@products.max_by do |element|
			element.price
		end
	end
	def price_between(min,max)
		@products.select do |element|
			element.price>min && element.price<max
		end	
	end
	def avg_price
		total=@products.reduce(0) do |total, element|
			total+element.price
		end
		(total/@products.count).round(2)
	end		
end

products = [
  { name: "Samsung Galaxy S6 Edge", price: 829.90, brand: "Samsung" },
  { name: "LG G Flex", price: 689.90, brand: "LG" },
  { name: "Apple iPhone 6 Plus", price: 779.90, brand: "Apple" },
  { name: "Samsung Galaxy Alpha", price: 589.90, brand: "Samsung" },
  { name: "Nokia Lumia 930", price: 489.90, brand: "Nokia" },
  { name: "Sony Xperia Z3 Compact", price: 389.90, brand: "Sony" },
  { name: "Apple iPhone 6", price: 779.90, brand: "Apple" },
  { name: "Huawei Ascend G7", price: 259.90, brand: "Huawei" },
  { name: "Sony Xperia T2 Ultra", price: 359.90, brand: "Sony" },
  { name: "LG G4", price: 589.90, brand: "LG" },
  { name: "Samsung Galaxy Note 4", price: 689.90, brand: "Samsung" },
  { name: "HTC One M9", price: 674.90, brand: "HTC" },
  { name: "Apple iPhone 5S", price: 589.90, brand: "Apple" }
]

collection = ProductCollection.new(products)

puts collection.filter_by_brand("Samsung")

# puts %Q(
#   Product count: #{ collection.count }

#   Product names: #{ collection.get_names }

#   Only 'LG' brand: #{ collection.filter_by_brand('LG') }

#   Count 'Samsung' brand: #{ collection.count_by_brand('Samsung') }

#   Group by brand: #{ collection.group_by_brand }

#   Most cheap: #{ collection.cheapest }

#   Most expensive: #{ collection.most_expensive }

#   Price between 200 and 400: #{ collection.price_between(200, 400) }

#   Average price: #{ collection.avg_price }
# )