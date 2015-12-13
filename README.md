## Simplify Local

Simplify Local is a way for people to find and support locally owned businesses near them. This is a demo application that earned a Top 6 Finalist spot at the <a href="http://mastersofcode.com/" target="_blank">Mastercard Master’s of Code Global Hackathon</a> in San Francisco (August 2015).


<img src="/app/assets/images/SimplifyLocalScreenshot.png" height="200">

#### Technologies Used
- Ruby on Rails
- AJAX
- jQuery
- Mapbox API
- Bcrypt
- HTML5 Geolocation
- Mastercard Simplify Commerce API (payment processing)
- Groupon API

#### Development Team
- <a href="https://github.com/joshlbaker" target="_blank">Josh Baker</a>
- <a href="https://github.com/zoejf" target="_blank">Zoe Foss</a>
- <a href="https://github.com/bgamwell" target="_blank">Brennan Gamwell</a>
- <a href="https://github.com/jhars" target="_blank">Jon Harlan</a>
- <a href="https://github.com/GregOSF" target="_blank">Greg Onza</a>

Local business and featured product data is currently being pulled from the Groupon web site. We plan to incorporate the Groupon API in order to get the most up-to-date business information.

The application originally featured third party login with the Twitter Digits API, but after temporary access to the API was ended after the Hackathon, we refactored to use Bcrypt for authorization/ authentication.

Our other goals for the future would be to create a more curated collection of verified local businesses. We would partner with local businesses that want their products featured on the site and allow them to add featured products themselves.
