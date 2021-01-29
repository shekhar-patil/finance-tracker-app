class StocksController < ApplicationController
  def search_stock
    stock = Stock.new_lookup(params[:stock].strip)
    render json: stock
  end
end
