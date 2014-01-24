xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'God Damn You Ryan Blog'
    xml.description 'Coding and Travel'
    xml.link blog_index_url

    @blogs.each do |blog|
      xml.item do
        xml.title do
          xml.cdata! blog.title
        end
        xml.description do
          xml.cdata! 'By Ryan MacInnes'
          xml.cdata! blog.body
        end
        if blog.title_image.present?
          xml.image do
            xml.url blog.title_image
            xml.title blog.title
            xml.link blog_url(blog)
          end
        end
        xml.pubDate blog.created_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog)
      end
    end
  end
end
