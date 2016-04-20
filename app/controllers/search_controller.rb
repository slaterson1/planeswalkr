class SearchController < ApplicationController
	
	def card_search
		@card = Card.where(name: params["name"])
		render :card_search
	end
end