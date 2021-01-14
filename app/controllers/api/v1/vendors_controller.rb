class Api::V1::VendorsController < ApplicationController
    
    def index 
        @vendors = Vendor.all
        render json: @vendors
    end

    def create
        @vendor = Vendor.new(vendor_params) 
        if @vendor.save
            render json: @vendors
        else
            render json: { error: "Error creating account"}
        end
    end

    def show 
        @vendor = Vendor.find(params[:id])
        render json: @vendor
    end

    def update 
        @vendor = Vendor.find(params[:id])
        @vendor.update(name: params["vendor"]["name"])
        @vendor.save
        render json: @vendor
    end

    def destroy
        @vendor = Vendor.find(params[:id])
        @vendor.destroy
    end


    private
    def vendor_params
        params.require(:vendor).permit(:name, :total_cost)
    end

end
