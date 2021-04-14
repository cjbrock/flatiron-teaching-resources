# yesterday we dealt with APIs. But what happens when, like Jonathan asked, there isn't an API available for the data we want to acquire?

# that's when web scraping comes in! 
# a couple of caveats for web scraping: if a site is JavaScript heavy, it's going to be *really* hard to scrape, and sometimes impossible. However, there always is a way around it. There are a billion websites out there, and there's always another non-js option out there.

- show ESPN site, how things load in, how you can tell. 
- show WhatRuns chrome extension
- 

# If we're going to get our data from scraping instead of an API, we're going to need a couple of different gems.

# for this project, we're going to be using the open-uri gem and a gem called nokogiri

# so first things first, let's swap those out for our rest-client gem and the json gem.

# open-uri allows us to open a headless browser on our machine, and retrieve the webpage 

# nokogiri actually converts that webpage into something called nokogiri nodes, which gives us something to parse through and allows us to use CSS selectors to create Ruby objects, just like we would with our API code. We just have to find out what those selectors should be, which is the interesting part of the whole thing. 

- rename API to scraper class

- swap out gems

# the pattern here is the same as the pattern for the API. We'll open the webpage, then use nokogiri to parse the document, then use a loop to create each element. We just have to figure out what the elements are! also show the page selection process

# set constant for the url

MOVIE_URL = "https://disney.fandom.com/wiki/Category:Star_Wars_characters"

# write the beginning of the method

def self.scrape_characters 
    html = open(MOVIE_URL)
    doc = Nokogiri::HTML(html)
    binding.pry
end

# show the nokogiri nodes, flip back to the webpage to show how we're goign to navigate to the right selector. show the predictable structure. 

# write your loop
def self.scrape_characters 
    html = open(MOVIE_URL)
    doc = Nokogiri::HTML(html)
    doc.css("li.category-page__member").each do | character | 
        binding.pry
        # name = 
        # url = 
        Character.new(name, url)
    end
end


# show how to whittle down the selectors

# url: character.css('a')
# character.css('a').attr("href")
# character.css('a').attr("href").value


# name: same, but text
# character.css('a').text
# character.css('a').text.strip

# now we're passing two arguments to the intialize method, so we need to adjust that

# 
