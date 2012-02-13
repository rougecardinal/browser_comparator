class BrowserComparatorController < ApplicationController

  def index
    @categories = Category.all
    @last_versions = BrowserFamily.all.map{|browser| browser.versions.last}
    @features = Feature.all
    current_user_agent
  end

  def startpage
    @browsers = BrowserFamily.all
    @last_versions = BrowserFamily.all.map{|browser| browser.versions.last}
    @features = Feature.all
    current_user_agent
  end

  def current_user_agent
    current_agent = Agent.new request.env['HTTP_USER_AGENT']
    str_user_agent = request.env['HTTP_USER_AGENT']

    if str_user_agent.include?("Firefox")
      user_agent = str_user_agent.split(" ")[9]
      user_agent_name = user_agent.split("/")[0]
      user_agent_version = user_agent.split("/")[1].split(".")[0]
      current_browser = BrowserFamily.find_by_name(user_agent_name)
      @last_versions.unshift current_browser.versions.find_by_name(user_agent_version)
    else
      current_agent_version_name = current_agent.version.split(".")[0]
      current_browser = BrowserFamily.find_by_name(current_agent.name)
      @last_versions.unshift current_browser.versions.find_by_name(current_agent_version_name)
    end
  end
end