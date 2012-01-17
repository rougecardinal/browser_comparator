class BrowserComparatorController < ApplicationController

  def index
    @browsers = BrowserFamily.all
    @features = Feature.all
    current_agent 
    # Appel de la methode current_agent dans la methode index 
    # pour pouvoir l'utiliser dans la vue index.html.haml
  end
  
  def current_agent
    @current_browser = Agent.new request.env['HTTP_USER_AGENT']
  end
end
