class GifsWrapper
  BASE_URL = "http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D"
  # http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D&q=steven-universe

  attr_reader :gif_urls

  def initialize(urls)
    @gif_urls = urls
  end

  def self.retrieive_gifs(query)
    gifData = giphy_request(query)
    urls = gif_urls(gifData)
    GifWrapper.new(urls)
  end

  private

  def giphy_request(query)
    response = Faraday.get("#{BASE_URL}&q=#{query}")
    return JSON.parse(response.body)
  end

  def gif_urls(gifData)
    image_urls = []
    parsed_gif_array.each do |gif_data|
      image_urls << gif_data["images"]["preview_gif"]["url"]
    end
    return image_urls
  end

end


# BASE_URL = "http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D"
# http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D&q=steven-universe
# query = "steven-universe"
#
# response = Faraday.get("#{BASE_URL}&q=#{query}")
#
# parsed_response = JSON.parse(response.body)
# parsed_response["data"][0]["images"]["preview_gif"]["url"]

# parsed_gif_array = parsed_response["data"]
# image_urls = []
# parsed_gif_array.each do |gif_data|
#   image_urls << gif_data["images"]["preview_gif"]["url"]
# end
