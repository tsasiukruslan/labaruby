require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './Item.rb'

class Cart

    def save_to_csv()
        path_csv = './laptop.csv'
        items = Item.get_All()
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Availability', 'Feedbacks'], write_headers: true) do |csv|
                items.each do |element|
                    csv << element.to_s()
                end
            end

            puts "Successfully writen in the csv file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the csv file for writing"
        end

    def save_to_json()
        path_json = './laptop.json'
        items = Item.get_All()

        begin 
            File.new(path_json, "w")

            File.open(path_json, "w") do |json|
                items.each do |element|
                    json.write(JSON.pretty_generate(element.to_h()))
                end
            end
        end


            puts "Successfully writen in the json file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the json file for writing"
        end
    end
end
