class PagesController < ApplicationController

	def show
		@page = Page.find_by!(name: params[:id])
	end

end
