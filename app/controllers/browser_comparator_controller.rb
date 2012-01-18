class BrowserComparatorController < ApplicationController

  def index
    @last_versions = BrowserFamily.all.map{|browser| browser.versions.last}
    @features = Feature.all
    current_user_agent 
    # Appel de la methode current_agent dans la methode index 
    # pour pouvoir l'utiliser dans la vue index.html.haml
    @last_versions.unshift(@current_browser_version)
    
  end
  
  def current_user_agent
    current_agent = Agent.new request.env['HTTP_USER_AGENT']    
    current_agent_version_name = current_agent.version.split(".")[0]
    
    @current_browser = BrowserFamily.find_by_name(current_agent.name)
    @current_browser_version = Version.find_by_name_and_browser_family_id(current_agent_version_name, @current_browser.id)
    
  end
end
