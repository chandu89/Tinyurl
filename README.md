# Tinyurl
Here I have added a URL minified algo: One tinify URL method is written. 

Markdown:
[Heroku Demo Url](https://stormy-cove-10376.herokuapp.com/)
 Implemented Changes

 	1. Bootstrap to change the UI
 	2. Decorator to work with URLmapper object using draper gem
 	3. Top 100 sites are coming based on visit_count 
 	4. Url validation is almost same as bitly which will not verify all http regex but only extensions and extensions are widely used ones only eg. .com
 	5. MemCache is implemented to fast showing 100 sites (Board) using dalli gem
 	6. pagination is implemented by gem 'kaminari'
 	
 Some changes which i can  do but due to lack of time i won't
 If you'll check my commit its a single day built in app.

 Improvment Area:

 	1. UI change needed
 	2. Deployment of heroku done but caching cant be added because i am using free version where i cant use memcache


