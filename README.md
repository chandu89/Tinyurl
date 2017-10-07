# Tinyurl
This is the project where you can grab the test of different websites which are already popular to shortening URL.
e.g [Bitly](https://bitly.com/), [google](https://goo.gl/) and [tinyUrl](https://tinyurl.com/)

*Here I tried to simplfy the Algo which actually help to short the URL.* 

[Heroku Demo Url](https://stormy-cove-10376.herokuapp.com/)

**Implemented Changes**

 	1. Bootstrap to change the UI.
 	2. Decorator to work with URLmapper object using draper gem.
 	3. Top 100 sites are coming based on visit_count.
 	4. Url validation is almost same as bitly which will not verify all http regex but only extensions and extensions are widely used ones only eg. .com
 	5. MemCache is implemented to fast showing 100 sites (Board) using dalli gem.
 	6. pagination is implemented by gem 'kaminari'.
 	
 *See there is always scope of improvement what i feel in any application irrespective of popularity whether its Facebook Or Google. So definately in my site also numerous improvment areas are there so i am adding couple of them.:simple_smile:*



 **Improvment Area:**

 	1. UI change needed.
 	2. Deployment of heroku done but caching cant be added because i am using free version where i cant use memcache.


