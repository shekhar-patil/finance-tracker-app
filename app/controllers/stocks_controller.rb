class StocksController < ApplicationController
  def search_stock
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock].strip)
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:alert] = 'Please enter valid ticker symbol'
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Please enter the ticker symbol'
      redirect_to my_portfolio_path
    end
  end
end
