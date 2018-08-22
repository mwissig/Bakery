require 'sinatra'
require 'curl'
require 'json'
require 'faker'

# Generates a fake phone number and address
$phone = Faker::PhoneNumber.phone_number
$city = Faker::Address.city
$address = Faker::Address.street_address + ', ' + $city + ' ' + Faker::Address.state_abbr + ' ' + Faker::Address.zip_code
p $phone

# A class for the info from the recipe API

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

# Calls the recipes API and searches for pastry then makes that into a class
response = CURL::Easy.perform('https://api.edamam.com/search?q=pastry&app_id=9fe0342d&app_key=7f95bba1174654a70a65111e5fcf85ce')
@food_data = JSON.parse(response.body_str)
@food_data['hits'].each_index do |i|
  title = @food_data['hits'][i]['recipe']['label']
  image = @food_data['hits'][i]['recipe']['image']
  ingredients = @food_data['hits'][i]['recipe']['ingredientLines']
  url = @food_data['hits'][i]['recipe']['url']
  recipe = Recipe.new(title, image, ingredients, url)
end

# API keys can be separated from the code but are needed to run it so are left in for now
# API_ID=9fe0342d APP_KEY=7f95bba1174654a70a65111e5fcf85ce ruby server.rb


# Classes for each bakery item
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

# Filling the classes with info
cookie = Cookie.new('Peanut Butter Cookies', 6.99, 'images/cookie2.png', 'A chewy peanut butter cookie with classic criss-crossed fork scoring.')
cookie = Cookie.new('Chocolate-Dipped Pistachio Rose Biscotti', 13.99, 'images/bisc.png', 'A crunchy floral-scented biscotti.')
cookie = Cookie.new('Chocolate Drizzled Lemon Cookies', 4.99, 'images/driz.png', 'Long strands of candied lemon topped with dark chocolate.')
cookie = Cookie.new('Hazelnut Toffee Truffle Praline Cookies', 4.04, 'images/http.png', 'Just browsing these decadent cookies will bring back memories.')
cookie = Cookie.new('Roasted Pineapple Honeycomb Cookies', 7.99, 'images/hon.png', 'We just thought this sounded good.')
cookie = Cookie.new('Sage Gingerbread Moose', 8.99, 'images/cookie4.png', 'Sweet and herbal moose-shaped cookies.')
cookie = Cookie.new('Iced Sugar &#9731; Unicode &#9731; Snowmen  &#9731;', 4.99, 'images/man.png', "Everyone's favorite character as a simple iced sugar cookie.")
cookie = Cookie.new('Apple Cookies', 14.99, 'images/cookie.png', "They're much more expensive than Linux Cookies.")

muffin = Muffin.new('Meyer Lemon Poppyseed Muffins', 4.55, 'images/lempopmuf.png', 'A twist on the classic lemon poppyseed muffin, made with a cross-breed of lemons and tangerines.')
muffin = Muffin.new('Banana Walnut Muffins', 3.99, 'images/muffin.png', 'Banana muffins with chopped walnuts and cinnamon.')
muffin = Muffin.new('Froot Loops Muffins', 5.75, 'images/loop.png', 'This boxed muffin assortment includes an array of froot flavors.')
muffin = Muffin.new('Bran Muffins', 3.45, 'images/muffin2.png', 'A simple muffin, in stark contrast to our more decadent flavors.')
muffin = Muffin.new('English Muffins', 5.99, 'images/engmuf.png', "As a bakery only allowed to produce cakes, cookies, and muffins, we're trying to sneak a yeast bread in.")
muffin = Muffin.new('Strawberry, Black Pepper and Basil Muffins', 5.99, 'images/straw.png', 'Sweet, herbal, peppery muffins with a cream cheese center.')
muffin = Muffin.new('Ruby Red Grapefruit Sparkling Water Muffins', 'SOLD OUT', 'images/ruby.png', 'This muffin is only available for a limited time.')
muffin = Muffin.new('Fried Pickle Muffins', 5.99, 'images/muffin4.png', 'Baked with pickle juice and topped with crispy fried pickle pieces.')

cake = Cake.new('Black Forest gateau', 24.99, 'images/blafor.png', 'A rich chocolate cake flavored with sour cherry brandy.')
cake = Cake.new('Lavender Angel Food Cake', 26.99, 'images/vict.png', 'A light, fluffy angel food cake flavored with lavender oil and lemon zest.')
cake = Cake.new('Erb Garden Cake', 22.99, 'images/garcake.png', "Relax and let our servers bring you this season's yield of fresh erbs.")
cake = Cake.new('Taiyaki Cake', 15.99, 'images/tai.png', 'This fish-shaped cake is filled with sweet red bean paste.')
cake = Cake.new('Spruce Tips, Juniper and Blackened Lemon Cake', 23.99, 'images/cake3.png', 'This piney lemon and cardamom cake will impress or confuse your guests.')
cake = Cake.new('Finger Lime Cake', 44.99, 'images/green.png', 'This cake is topped with the vesicles of red and green Australian finger limes.')
cake = Cake.new('Rose Petal Cheesecake', 33.99, 'images/rose.png', 'A dense, creamy and floal cheesecake topped with candied rose petals.')
cake = Cake.new('Bob Ross Cake', 22.99, 'images/cake4.png', "A devil's food cake sweetened with shredded beets and brushed with a walnut glaze.")

# The pages
get '/' do
  erb :home
end

get '/:pastry' do
   @pastry = params[:pastry]
  erb :pastry
end
