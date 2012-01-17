module BrowserComparatorHelper
  
  def compare_features_value(browser, feature)
    css_class = ""
    if browser.last_version_has_feature?(feature)
      text = "Oui"
      css_class  = "has_not_and_has" if !@current_browser.last_version_has_feature?(feature)
    else
      text = "Non"
      css_class  = "has_and_has_not" if @current_browser.last_version_has_feature?(feature)
    end

    content_tag(:td, text, class: css_class)
  end
end
