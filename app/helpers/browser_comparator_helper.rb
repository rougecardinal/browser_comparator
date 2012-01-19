module BrowserComparatorHelper

  def compare_features_value(version, feature, for_current_browser)
    if version.has_feature? feature 
      text = t 'has_feature'
      css_class  = ["has"]
    else
      text = t 'has_not_feature'
      css_class  = ["has_not"]
    end
    css_class << "current_browser" if for_current_browser
    content_tag(:td, text, class: css_class)
  end

  def current_browser_has_feature(feature)
    @last_versions[0].has_feature?(feature) ? "has_feature" : "has_not_feature"
  end
end
