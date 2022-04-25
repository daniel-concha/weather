# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.

# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...

# STEPS
# Look at the weather_data hash.
# Find the current data.
# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"
# Find the array of forecast data.
# Read only the first element of that array to display the conditions for the rest of today.
# Use a loop to display the daily summary for the upcoming forecast.

# 1. inspect the weather_data hash
puts weather_data
current_temp = weather_data["currentConditions"]["temp"]["f"]
current_sunshine = weather_data["currentConditions"]["comment"].downcase
todays_high = weather_data["next_days"][0]["max_temp"]["f"]
todays_sunshine = weather_data["next_days"][0]["comment"].downcase

# 2. Add the loop for the extended forecast
day2_day = ""

for forecast in weather_data["next_days"]
    if forecast == 1
        day2_day = weather_data["next_days"][forecast]["day"]
        day2_high = weather_data["next_days"][forecast]["max_temp"]
        day2_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    elsif forecast == 2
        day3_day = weather_data["next_days"][forecast]["day"]
        day3_high = weather_data["next_days"][forecast]["max_temp"]
        day3_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    elsif forecast == 3
        day4_day = weather_data["next_days"][forecast]["day"]
        day4_high = weather_data["next_days"][forecast]["max_temp"]
        day4_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    elsif forecast == 4
        day5_day = weather_data["next_days"][forecast]["day"]
        day5_high = weather_data["next_days"][forecast]["max_temp"]
        day5_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    elsif forecast == 5
        day6_day = weather_data["next_days"][forecast]["day"]
        day6_high = weather_data["next_days"][forecast]["max_temp"]
        day6_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    elsif forecast == 6
        day7_day = weather_data["next_days"][forecast]["day"]
        day7_high = weather_data["next_days"][forecast]["max_temp"]
        day7_sunshine = weather_data["next_days"][forecast]["comment"].downcase
    end
end


puts "In Chicago, IL it is currently #{current_temp} degrees and #{current_sunshine}.
The rest of today will be a high of #{todays_high} and #{todays_sunshine}.
The upcoming weather forecast is:
#{day2_day}: a high of #{day2_high} and #{day2_sunshine}.
#{day3_day}: a high of #{day3_high} and #{day3_sunshine}.
#{day4_day}: a high of #{day4_high} and #{day4_sunshine}.
#{day5_day}: a high of #{day5_high} and #{day5_sunshine}.
#{day6_day}: a high of #{day6_high} and #{day6_sunshine}.
#{day7_day}: a high of #{day7_high} and #{day7_sunshine}.
"

puts weather_data["next_days"]
puts weather_data["next_days"][1]["day"]

# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.