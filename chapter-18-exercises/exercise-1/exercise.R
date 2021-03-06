# load relevant libraries
library("httr")
library("jsonlite")

# Be sure and check the README.md for complete instructions!


# Use `source()` to load your API key variable from the `apikey.R` file you made.
# Make sure you've set your working directory!
source("apikey.r") # go to that file, select all, and hit ctrl + enter

query_params <- list("api-key" = nyt_key)

# Create a variable `movie_name` that is the name of a movie of your choice.
movie_name <- "Interstellar"

# Construct an HTTP request to search for reviews for the given movie.
# The base URI is `https://api.nytimes.com/svc/movies/v2/`

base_uri <- "https://api.nytimes.com/svc/movies/v2/"

# The resource is `reviews/search.json`

endpoint <- "reviews/search.json"

uri <- paste0(base_uri, endpoint)

# See the interactive console for parameter details:
#   https://developer.nytimes.com/movie_reviews_v2.json
#
# You should use YOUR api key (as the `api-key` parameter)
# and your `movie_name` variable as the search query!
query_params_list <- list("query" = movie_name, "api-key" = nyt_key)

# Send the HTTP Request to download the data
# Extract the content and convert it from JSON
response <- GET(uri, query = query_params_list)
body <- content(response, "text")
data <- fromJSON(body)

# What kind of data structure did this produce? A data frame? A list?
print(is.data.frame(data))
print(is.list(data))
print("It's a list")


# Manually inspect the returned data and identify the content of interest 
# (which are the movie reviews).
# Use functions such as `names()`, `str()`, etc.
movie_data <- data$results

# Flatten the movie reviews content into a data structure called `reviews`

# From the most recent review, store the headline, short summary, and link to
# the full article, each in their own variables
movie_headline = movie_data$headline
summary = movie_data$summary_short
link = movie_data$link.url

# Create a list of the three pieces of information from above. 
# Print out the list.
get_movie_info <- function(){
  movie_info <- list(
    headline = movie_headline,
    summary = summary,
    link = link
  )
}
