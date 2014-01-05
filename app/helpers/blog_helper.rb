module BlogHelper

  def blog_page_path(page)
    blog_index_path + "/page/#{page}"
  end
end
