class AdminDashboardController < ApplicationController

  def index
    #where(something).where(something else) is equivalent to where(something) and where(something else)
    @current_trimester = Trimester.where("start_date <= ?", Date.today).where("end_date >= ?", Date.today).first
    @upcoming_trimester = Trimester.where("start_date >= ?", Date.today).where("start_date < ?", Date.today + 6.months).first
   end

end
