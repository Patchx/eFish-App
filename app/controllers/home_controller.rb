class HomeController < ApplicationController
	def welcome
	end

	def demo
		require 'statsample'
		a=100.times.collect {rand*10}#.to_scale
		b=100.times.collect {rand*10}#.to_scale
		c=100.times.collect {rand*10}#.to_scale
		y=100.times.collect {rand*10}#.to_scale
		ds={'a'=>a,'b'=>b,'c'=>c, 'y'=>y}.to_dataset
		ds['y'].each do |i| 
			ds['y'][i] = ds['a'][i]*rand() + ds['b'][i]*rand() + ds['c'][i]*rand()
		end
		@lr=Statsample::Regression.multiple(ds,'y')
	end
end
