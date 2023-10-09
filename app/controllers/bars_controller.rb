# app/controllers/bars_controller.rb
class BarsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @bars = Bar.all
    end
  
    def show
      @bar = Bar.find(params[:id])
    end
  
    def new
      @bar = Bar.new
    end
  
    def create
      @bar = Bar.new(bar_params)
      if @bar.save
        redirect_to @bar, notice: 'Bar was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @bar = Bar.find(params[:id])
    end
  
    def update
      @bar = Bar.find(params[:id])
      if @bar.update(bar_params)
        redirect_to @bar, notice: 'Bar was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @bar = Bar.find(params[:id])
      @bar.destroy
      redirect_to bars_url, notice: 'Bar was successfully deleted.'
    end
  
    private
  
    def bar_params
      params.require(:bar).permit(:name, :drink_name, :drink_description, :drink_picture_url, :city_walkability, :city_crime_rate)
    end
  end