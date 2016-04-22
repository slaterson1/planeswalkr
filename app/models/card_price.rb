# PriceAPI.get_price(@card)

require 'nokogiri'
require 'httparty'
require 'open-uri'

class Prices	

	def get_set_url
		set_name = card_sets.name
		set_html = HTTParty.get(http://mtgjson.com/sets/"#{'set_name'}".html)
		# LOST!!!!!!!!! HELP MEEEEE!!!!!!!!!!!!
		set_url = Nokogiri::HTML(set_html)
		set_url.xpath("//a[contains(@href, 'info')]/@href")
	end	

	def get_price(card)
		number = card.mciNumber
		card_html = HTTParty.get(http://www.magiccards.info/al/en/"#{'mciNumber'}".html)
		price = Nokogiri::HTML(card_html)
		price.xpath("//td[@class='TCGPHiLoMid']")
	end
end	