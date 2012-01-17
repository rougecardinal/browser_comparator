module BrowserComparatorHelper
  
  def compare_features_value(browser, feature)
    browser.last_version_has_feature?(feature) == @current_browser.last_version_has_feature?(feature)
  end
  
end
