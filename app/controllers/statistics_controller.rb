class StatisticsController < ApplicationController
  def index
    @files = Statistic.all
  end

  def show
    @file = Statistic.find(params[:id])
  end

	def new
	  @file = Statistic.new
	end

	def edit
	  @file = Statistic.find(params[:id])
	end
	 
	def create
	  @file = Statistic.new()
	  if @file.save
	    redirect_to @file
	  else
	    render 'new'
	  end
	end

	def update
	  @file = Statistic.find(params[:id])
	  redirect_to @file
	end

	def destroy
	  @file = Statistic.find(params[:id])
	  @file.destroy
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
		CSV.foreach(filename, :headers => true) do |row|
  		output = Statistic.create!(row.to_hash)
  		return mlr(output)
		end
	end
end
