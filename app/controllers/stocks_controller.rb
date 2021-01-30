class StocksController < ApplicationController
  def search_stock
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock].strip)
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter valid ticker symbol'
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a ticker symbol'
        format.js { render partial: 'users/result' }
      end
    end
  end
end
