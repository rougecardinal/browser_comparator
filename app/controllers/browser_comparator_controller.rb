class BrowserComparatorController < ApplicationController

  def index
    @browsers = BrowserFamily.all
    @features = Feature.all
  end

end
