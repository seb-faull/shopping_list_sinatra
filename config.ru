require "sinatra"
require "sinatra/reloader" if development?

require_relative "./controllers/shopping_item_controller.rb"

use Rack::MethodOverride


run ShoppingItemsController