class Api::V1::Items::SearchController < ApplicationController

  def show
    render json: Item.find_by(item_params)
  end

  def index
    render json: Item.where(item_params)
  end

  private

    def item_params
      unless params[:unit_price].nil?
        params[:unit_price] = params[:unit_price].to_i * 100
      end
      params.permit(:id, :name, :unit_price, :created_at, :updated_at)
    end
end