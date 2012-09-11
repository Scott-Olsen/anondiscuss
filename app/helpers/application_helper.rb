module ApplicationHelper

  def full_title(page_title)
    base_title = "Anondiscuss" #TODO: Base title should be configurable from elsewhere
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end 
  def page_url()
    return #{request.protocol}#{request.host_with_port}#{request.fullpath};
  end
end
