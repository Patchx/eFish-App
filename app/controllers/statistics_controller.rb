class StatisticsController < ApplicationController
  def index
    @statistics = Statistic.all
  end

  def show
    @statistic = Statistic.find(params[:id])
  end

	def new
	  @statistic = Statistic.new
	end

	def edit
	  @statistic = Statistic.find(params[:id])
	end
	 
	def create
	  @statistic = Statistic.new(statistic_params)
	  if @statistic.save
	    redirect_to @statistic
	  else
	    render 'new'
	  end
	end

	def update
	  @statistic = Stock.find(params[:id])
	  if @statistic.update(statistic_params)
	    redirect_to @statistic
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @statistic = Statistic.find(params[:id])
	  @statistic.destroy
	  redirect_to statistics_path
	end

	def demo
		require 'statsample'
		a=100.times.collect {rand*10}#.to_scale
		b=100.times.collect {rand*10}#.to_scale
		c=100.times.collect {rand*10}#.to_scale
		y=100.times.collect {rand*10}#.to_scale
		ds={'a'=>a,'b'=>b,'c'=>c, 'y'=>y}.to_dataset
		# --------------------------------------------------------------
		# The each loop below transforms y to be influenced by a,b and c.

		# If you comment the loop out and the MLR still shows a relationship,
		#   then that relationship happened purely by 'chance'.

		# Very high R^2 relationships tend to throw an exception.
		#   I believe this is due to the alogrithm trying to take a negative
		#   square root during the process.
		# --------------------------------------------------------------
		ds['y'].each do |i| 
			ds['y'][i] = ds['a'][i]*rand() + ds['b'][i]*rand() + ds['c'][i]*rand()
		end
		@lr=Statsample::Regression.multiple(ds,'y')
	end

	def mlr(filename)
		require 'csv'    
		CSV.foreach("$HOME/#{filename}", :headers => true) do |row|
  		output = Statistic.create!(row.to_hash)
		end
	end

  private

  def statistic_params
    params.require(:statistic).permit(:filename)
  end
end
