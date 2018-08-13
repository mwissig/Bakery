require "sinatra"
require 'curl'
require 'json'

$recipes = []

class Recipe
  attr_accessor :title, :image, :ingredients, :url
  def initialize(title, image, ingredients, url)
    @title = title
    @image = image
    @ingredients = ingredients
    @url = url
    $recipes << self
  end
end

  response = Curl::Easy.perform("https://api.edamam.com/search?q=dessert&app_id=9fe0342d&app_key=7f95bba1174654a70a65111e5fcf85ce")
    @food_data = JSON.parse(response.body_str)
    # @food = @food_data['food']
    @food_data['hits'].each_index do |i|
      title = @food_data['hits'][i]['recipe']['label']
      image = @food_data['hits'][i]['recipe']['image']
      ingredients = @food_data['hits'][i]['recipe']['ingredientLines']
      url = @food_data['hits'][i]['recipe']['url']
      recipe = Recipe.new(title, image, ingredients, url)
    end

# API_ID=9fe0342d APP_KEY=7f95bba1174654a70a65111e5fcf85ce ruby server.rb

$cookies = []
$cakes = []
$muffins = []

class Cookie
  attr_accessor :name, :price, :image, :description
  def initialize(name, price, image, description)
    @name = name
    @price = price
    @image = image
    @description = description
    $cookies << self
end
end

class Cake
  attr_accessor :name, :price, :image, :description
  def initialize(name, price, image, description)
    @name = name
    @price = price
    @image = image
    @description = description
    $cakes << self
end
end

class Muffin
  attr_accessor :name, :price, :image, :description
  def initialize(name, price, image, description)
    @name = name
    @price = price
    @image = image
    @description = description
    $muffins << self
end
end


cookie = Cookie.new("Peanut Butter Cookies", 6.99, "images/cookie.png", "A chewy peanut butter cookie with classic criss-crossed fork scoring.")
cookie = Cookie.new("Chocolate-Dipped Pistachio Rose Biscotti", 13.99, "images/cookie.png", "A crunchy floral-scented biscotti.")
cookie = Cookie.new("Chocolate Drizzled Lemon Cookies", 4.99, "images/cookie.png", "Long strands of candied lemon topped with dark chocolate.")
cookie = Cookie.new("Hazelnut Toffee Truffle Praline Cookies", 4.04, "images/cookie.png", "Just browsing these decadent cookies will bring back memories.")
muffin = Muffin.new("Meyer Lemon Poppyseed Muffins", 4.50, "images/muffin.png", "A twist on the classic lemon poppyseed muffin, made with a cross-breed of lemons and tangerines.")
muffin = Muffin.new("Banana Walnut Muffins", 3.99, "images/muffin.png", "Banana muffins with chopped walnuts and cinnamon.")
muffin = Muffin.new("Froot Loops Muffins", 5.75, "images/muffin.png", "This muffin assortment loops through an array of fruit flavors.")
cake = Cake.new("Black Forest gateau", 24.00, "images/cake.png", "A rich chocolate cake flavored with sour cherry brandy.")
cake = Cake.new("Lavender Angel Food Cake", 26.00, "images/cake.png", "A light, fluffy angel food cake flavored with lavender oil and lemon zest.")
cake = Cake.new("Frank Sinatra's Erb Garden Cake", 22.00, "images/cake.png", "Please accept this season's yield of fresh erbs from our courteous servers.")

get "/" do
  erb :home
end

get "/cookies" do
  erb :cookies
end

get "/cakes" do
  erb :cakes
end

get "/muffins" do
  erb :muffins
end
