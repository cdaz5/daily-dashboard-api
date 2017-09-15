require 'httparty'
require 'nokogiri'

class Api::V1::ImagesController < ApplicationController

  def index
    images = Image.all

    render json: images
  end

  def scrape
    response = HTTParty.get('https://newsapi.org/sources')
    parse_page = Nokogiri::HTML(response)
    i = 1
    imgs =[]
    while i < 71
      imgs << parse_page.css("body > main > div > article > section > div.sources-container.row > div:nth-child(#{i}) > a > img")
      i += 1
    end
    imgs.flatten.map do |img|
      Image.create(name: img.attributes['alt'].value, src: img.attributes['src'].value)
    end
  end

  def fetch_sources_from_api
    response = HTTParty.get("https://newsapi.org/v1/sources?&apiKey=#{ENV['news_api_key']}")
    response['sources'].map do |source|
      Source.create(api_id: source['id'], name: source['name'], description: source['description'], url: source['url'], category: source['category'], language: source['language'], country: source['country'])
    end
  end

  def sources
    sources = Source.all

    render json: sources
  end



end
