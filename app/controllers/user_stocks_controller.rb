class UserStocksController < ApplicationController
  def create
    stock = Stock.where(ticker: params[:ticker].strip).first
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker].strip)
      stock.save
    end

    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was added successfully to your portfolio"

    redirect_to my_portfolio_path
  end
end
