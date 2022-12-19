require 'csv'
require './Parser.rb'
require './Cart.rb'

parser = Parser.new('https://vsedlasna.com/matrasy/')

cart = Cart.new()

parser.parse()
cart.save_to_csv()
cart.save_to_json()
