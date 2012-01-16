class BrowserComparatorController < ApplicationController


  def index
    @browsers = BrowserFamily.all
    @features = Feature.all
    @current_browser = request.env['HTTP_USER_AGENT']
  end


end
