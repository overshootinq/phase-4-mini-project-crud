class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    def show
        spice = Spice.find(params[:id])
        render json: spice
    end

    def create
        new_spice = Spice.find_or_create_by(title: params[:title], image: params[:image], description: params[:description], notes: params[:notes], rating: params[:rating])
        render json: new_spice, status: 201
    end

    def update
        spice = Spice.find(params[:id])
        spice[:rating] = params[:rating]
        spice.save
        render json: spice
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.delete
    end
end
