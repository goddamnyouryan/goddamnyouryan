# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://goddamnyouryan.com"

SitemapGenerator::Sitemap.create do
  add '/blog'

  Blog.find_each do |blog|
    add blog_path(blog), lastmod: blog.updated_at
  end
end
