class ShoppingItemsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views') }


	$shopping_items = [{
		title: "Item 1",
		body: "This is the first shopping item"
	},
	{
		title: "Item 2"
		body: "This is the second shopping item"
	},
	{
		title: "Item 3"
		body: "This is the third shopping item"
	}]






end