class BrowserComparatorController < ApplicationController

  def index
    @browsers = BrowserFamily.all
  end

end
