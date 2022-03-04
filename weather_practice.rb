require "http"
while true
  puts "Where do you live?"
  place = gets.chomp
  puts "Do you prefer Celcius or Farenheit? (imperial or metric)"
  temp_units = gets.chomp
  request = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{place}&units=#{temp_units}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")

  weather_data = JSON.parse(request.body)
  temp = weather_data["main"]["temp"]
  description = weather_data["weather"][0]["description"]
  puts "Today it's #{temp} degrees and #{description}"
  puts "Enter 'Q' when you are finished."
  exit_weather = gets.chomp
  if exit_weather == "Q"
    break
  else
  end
end
