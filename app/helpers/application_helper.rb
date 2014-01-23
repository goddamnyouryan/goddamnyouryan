module ApplicationHelper

  def title_image
    if @blog.present? && @blog.title_image.present?
      class_string = 'with-title-image'
      if @blog.dark
        class_string += ' dark'

      else
        class_string += ' light'
      end
      class_string
    end
  end
end
