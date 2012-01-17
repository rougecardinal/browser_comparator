class BrowserComparatorController < ApplicationController

  def index
    @browsers = BrowserFamily.all
    @features = Feature.all
    current_agent
  end
  
  def current_agent
    informations = request.env['HTTP_USER_AGENT']
    @current_browser = Agent.new "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.75 Safari/535.7"
  end
end
