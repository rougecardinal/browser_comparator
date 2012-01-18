module BrowserComparatorHelper

  def compare_features_value(version, feature)
    if version.has_feature?(feature)
      text = "Oui"
      css_class  = "has"
    else
      text = "Non"
      css_class  = "has_not"
    end
    content_tag(:td, text, class: css_class)
  end
  
  def current_browser_has_feature(feature)
    @current_browser_version.has_feature?(feature) ? "has_feature" : "has_not_feature"
  end  
end
