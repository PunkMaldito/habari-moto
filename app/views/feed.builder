xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Habari Moto News"
    xml.description "East African news at your finger tips!"
    xml.link "http://habari-moto.herokuapp.com/feed"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link post.url

        xml.description(%{
          #{post.summary}
          <p>
            <a href="#{post.url}">Read more</a> |
            <a href="#{post.slug_url}">Comments</a>
          </p>
        })

        xml.pubDate post.published_at.rfc822
        xml.guid post.slug
      end
    end
  end
end