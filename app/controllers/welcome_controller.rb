class WelcomeController < ApplicationController
  def index
    @fruits = Store.all
  end
end
