module ApplicationHelper

  def title_image
    if params[:controller] == 'blog' && params[:action] == 'show' && @blog.title_image.present?
      'with-title-image'
    end
  end
end
