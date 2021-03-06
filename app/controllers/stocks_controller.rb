class StocksController < ApplicationController

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

	def new
	  @stock = Stock.new
	end

	def edit
	  @stock = Stock.find(params[:id])
	end
	 
	def create
	  @stock = Stock.new(stock_params)
	  if @stock.save
	    redirect_to @stock
	  else
	    render 'new'
	  end
	end

	def update
	  @stock = Stock.find(params[:id])
	  if @stock.update(stock_params)
	    redirect_to @stock
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @stock = Stock.find(params[:id])
	  @stock.destroy
	  redirect_to stocks_path
	end

  private

  def stock_params
    params.require(:stock).permit(:name, :stockID)
  end

  def self.get_price(input)
		input = input.downcase
	  website = HTTParty.get("http://finance.yahoo.com/q?s=#{input}")
	  noko = Nokogiri::HTML(website.body)
	  price = noko.xpath("//span[@id='yfs_l84_#{input}']")
	  if price.children[0] == nil
	    return "not found"
	  else
		  price = price.children[0].content.to_f.to_s(:currency)
		  return price
	  end
  end

end
