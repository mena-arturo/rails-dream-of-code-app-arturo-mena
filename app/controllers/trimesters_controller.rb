class TrimestersController < ApplicationController

  def index
	@trimesters = Trimester.all
  end

  def show
	#@trimester = Trimester.first
  end
end
