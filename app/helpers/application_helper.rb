module ApplicationHelper
  def title(text)
    content_for :title, text
  end

  # ImageKit blob keys can contain spaces (legacy uploads). URL-encode each path
  # segment so the gem doesn't raise URI::InvalidComponentError.
  def ik_image_tag(src, options = {})
    if src.is_a?(ActiveStorage::Attached::One) && src.attached?
      encoded = src.blob.key.split("/").map { |s| CGI.escape(s).gsub("+", "%20") }.join("/")
      super(encoded, options)
    else
      super(src, options)
    end
  rescue ArgumentError, URI::InvalidComponentError
    nil
  end
end
