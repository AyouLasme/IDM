module Avo
  class WelcomeController < ApplicationController
    def index
      render plain: "Welcome from Avo!"
    end
  end
end
