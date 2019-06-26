require "sinatra"
require "sinatra/json"
require "json"
require "sinatra/reloader" if development?
require "pry" if development? || test?
# ---------------------------------------------------------------------
require "faraday"
# ------------------------------------------------------------------
set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

require_relative "gifs_wrapper"

CURRENT_FILE_PATH = File.dirname(__FILE__)

def read_weirdos
  JSON.parse(File.read("weirdos.json"))
end

before do
  headers({ "Access-Control-Allow-Origin" => "*" })
end

# -----------------------------------------------------------------

get "/" do
  erb :home
end

get "/api/v1/gifs" do
  image_urls = []
  BASE_URL = "http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D"
  query = "steven-universe"
  response = Faraday.get("#{BASE_URL}&q=#{query}")

  parsed_response = JSON.parse(response.body)
  image_urls = []
  parsed_response["data"].each do |gif|
    image_urls<< gif["images"]["preview_gif"]["url"]
  end
  
  # image_urls = GifsWrapper.retrieive_gifs("weirdos").gif_urls

  content_type :json
  json image_urls
end

get "/api/v1/weirdos" do
  weirdos = read_weirdos

  content_type :json
  json weirdos
end

post "/api/v1/weirdos" do
  current_weirdos = read_weirdos

  weirdo = JSON.parse(request.body.read)
  weirdo["id"] = current_weirdos.last["id"] + 1

  current_weirdos << weirdo
  File.write("weirdos.json", JSON.pretty_generate(current_weirdos))

  content_type :json
  status 201
  json weirdo
end

get "/api/v1/weirdos/:id" do
  weirdos = read_weirdos
  # binding.pry

  weirdo = weirdos.find do |weirdo|
    weirdo["id"] == params[:id].to_i
  end

  content_type :json
  json weirdo
end

# If the path does not match any of the above routes, render the erb page.
get "*" do
  erb :home
end
