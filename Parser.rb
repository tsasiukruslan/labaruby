require 'open-uri'
require 'byebug'
require 'nokogiri'
require './Item.rb'

class Parser

    def initialize(url)
        @url = url
    end

    def parse()
        begin
            html = URI.open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)
            i = 0
            doc.css('.catalog-grid__cell').each do |element|
                item = Item.new()
                item.name = element.css(".goods-tile__heading").css(".goods-tile__title").text
                item.price = element.css(".goods-tile__price").css(".goods-tile__price-value").text.split(" ")[0]
                item.feedbacks = element.css(".goods-tile__rating").css(".goods-tile__reviews-link").text
                item.availability = element.css(".goods-tile__availability").text
                item.id = i+1
                i= i+1
                Item.set_item(item)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end
