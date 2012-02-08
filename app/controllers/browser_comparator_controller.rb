class BrowserComparatorController < ApplicationController

  def index
    @categories = Category.all
    @last_versions = BrowserFamily.all.map{|browser| browser.versions.last}
    @features = Feature.all
    current_user_agent     
  end

  def startpage
    @categories = Category.all
    @last_versions = BrowserFamily.all.map{|browser| browser.versions.last}
    @features = Feature.all
    current_user_agent 
  end
  
  def current_user_agent
    current_agent = Agent.new request.env['HTTP_USER_AGENT']    
    current_agent_version_name = current_agent.version.split(".")[0]
    
    current_browser = BrowserFamily.find_by_name(current_agent.name)
    @last_versions.unshift current_browser.versions.find_by_name(current_agent_version_name)
  end
end
