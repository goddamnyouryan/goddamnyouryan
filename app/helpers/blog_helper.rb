module BlogHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def blog_title
    headline = 'Goddamn You Ryan MacInnes - A Kickass Blog for a Kickass Dude'
    if content_for?(:title)
      [content_for(:title), ' - ', headline].join
    else
      headline
    end
  end
end
