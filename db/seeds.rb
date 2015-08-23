# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = Business.create([
  {
    name: "Cole Hardware",
    address: "70 4th Street, San Francisco, CA",
    lat: "37.7847078",
    lng: "-122.4048963",
    phone: "415-777-4400",
    website: "http://www.colehardware.com/",
    description: "Cole Hardware company was founded in Cole Valley, San Francisco, in the 1920s.",
    merch_assoc: "SOMBA: South of Market Business Association"
  },
  {
    name: "The Iron Cactus",
    address: "683 4th Street, San Francisco, CA",
    lat: "37.7775587",
    lng: "-122.39524",
    phone: "415-777-1004",
    website: "http://ironcactussf.com/",
    description: "The Iron Cactus is a healthy, authentic Mexican restaurant located in San Francisco's SOMA neighborhood."
  },
  {
    name: "Cafe Flore",
    address: "2298 Market Street, San Francisco, CA",
    lat: "37.7646558",
    lng: "-122.4329428",
    phone: "415-621-8579",
    website: "http://www.cafeflore.com/",
    description: "Cafe Flore is a coffee bar and restaurant with a large outdoor patio."
  },
  {
    name: "Sweet Inspiration Bakery",
    address: "2239 Market Street, San Francisco, CA",
    lat: "37.7650415",
    lng: "-122.4316403",
    phone: "415-621-8664",
    website: "http://www.sweetinspirationbakery.com/",
    description: "Mom-and-pop bakery in the heart of the San Francisco's Castro neighborhood."
  }
]);

allProducts = Product.create([
  {
    name: "Pasta Spoon",
    price: 499,
    description: "Oneida stainless steel pasta spoon.",
    image: "http://www.contentfaq.com/wp-content/uploads/2015/08/pasta-spoon.png",
    business_id: 1,
  },
  {
    name: "Tea Infuser",
    price: 899,
    description: "Whimsical tea infusers make a perfect gift.",
    image: "http://www.contentfaq.com/wp-content/uploads/2015/08/novelty-tea.png",
    business_id: 1,
  },
]);
