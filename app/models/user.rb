class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def stock_already_tracked?(ticker)
    Stock.where(ticker: ticker.strip).first.blank?
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def can_track_stocks?(ticker)
    under_stock_limit? && stock_already_tracked?(ticker)
  end
end
