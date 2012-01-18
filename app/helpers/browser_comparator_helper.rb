module BrowserComparatorHelper

  def compare_features_value(browser, feature)
    if browser.last_version_has_feature?(feature)
      text = "Oui"
      css_class  = "has"
    else
      text = "Non"
      css_class  = "has_not"
    end
    content_tag(:td, text, class: css_class)
  end
  
  def current_browser_has_feature(feature)
    if @current_browser.last_version_has_feature?(feature)
      "has_feature"
    else
      "has_not_feature"
    end
  end  
end
