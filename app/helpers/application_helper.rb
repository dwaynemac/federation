module ApplicationHelper

  def autocomplete_script(options)
    css_selector = options[:css_selector]
    data_array = options[:array]
    data_url = options[:url]
    html = ""
    content_tag :script do
      if data_array
        html << "var data = '#{data_array.join(', ')}'; "
      else
        html << "use data_url to get json; "
      end
      html << "$('#{css_selector}').autocomplete(data, {matchContains: 'word'}); "
    end
  end

end
