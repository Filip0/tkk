class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_page, only: [:show, :edit, :update, :destroy]

	def index
		@pages = Page.all
	end

	def show
	end

	def new
		@page = Page.new
	end

	def edit
	end

	def create
		@page = Page.new(page_params)

		respond_to do |format|
			if @page.save
				format.html { redirect_to [:admin, @page], notice: 'Page has been create'}
				format.json { render :show, status: :created, location: @page }
			else
				format.html { render :new }
				format.json { render json: @page.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @page.update(page_params)
				format.html { redirect_to [:admin, @page], notice: 'Page was successfully updates.' }
				format.json { render :show, status: :ok, location: @page }
			else
				format.html { render :edit }
				format.json { render json: @page.erros, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@page.destroy
		repond_to do |format|
			format.html { redirect_to root, notice: 'Page was successfully destroyed.' }
			format.json { head :no_content}
		end
	end

	private

		def set_page
			@page = Page.find(params[:id])
		end

		def page_params
			params.require(:page).permit(:title, :text, :name)
		end

end
