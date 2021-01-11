class Api::V1::ProductsController < ApplicationController
    before_action :find_vendor
    

    def index
        @products = @vendor.products
        render json: @products
    end


    def create
        @product = @vendor.products.new(product_params)

        if @vendor.update_total_cost(@product) != 'total cost can not be less than product price.'
            @product.save
            render json: @product
        else 
            render json: {error: 'total cost can not be less than product price.'}
        end
    end


    def show 
        @product = Product.find(params[:id])
        render json: @product
    end


    def update 
        @product = Product.find(params[:id])
        @product.update(name: params["vendor"]["name"])
        @product.save
        render json: @product
    end


    def destroy
        @product = Product.find(params[:id])
        @vendor = Vendor.find(@product.vendor_id)

        if @vendor.update_total_cost_on_delete(@product)
            @product.destroy
            render json: @product
        else
            render json: {error: 'total cost can not be less than product price.'}
        end
    end


    private
    def find_vendor
        @vendor = Vendor.find(params[:vendor_id])
    end

    def product_params
        params.require(:product).permit(:vendor_id, :name, :description, :price, :kind, :discount_rate)
    end

end
