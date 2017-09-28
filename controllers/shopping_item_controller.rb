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
		title: "Item 2",
		body: "This is the second shopping item"
	},
	{
		title: "Item 3",
		body: "This is the third shopping item"
	}]

	#Index
	get "/shopping_items" do
		@page_header = "All shopping items"
		@shopping_items = $shopping_items
		erb :"shopping_items/index"
	end


	#New
	get "/shopping_items/new" do
		erb :"shopping_items/new"
	end


	#Create
	post "/shopping_items" do
		new_shopping_item = {
			title: params[:title],
			body: params[:body]
		}
		$shopping_items << new_shopping_item
		redirect "/shopping_items"
	end


	#Show
	get "/shopping_items/:id" do
		id = params[:id].to_i
		@shopping_item = $shopping_items[id]
		erb :"shopping_items/show"
	end


	#Edit
	get "/shopping_items/:id/edit" do
		@id = params[:id].to_i
		@shopping_item = $shopping_items[@id]

		erb :"shopping_items/edit"
	end


	#Update
	put "/shopping_items/:id" do
		id = params[:id].to_i
		$shopping_items[id][:title] = params[:title]
		$shopping_items[id][:body] = params[:body]
		redirect "/shopping_items/#{id}"
	end


	#Delete
	delete "/shopping_items/:id" do
		id = params[:id].to_i
		$shopping_items.delete_at(id)
		redirect "/shopping_items"
	end



end