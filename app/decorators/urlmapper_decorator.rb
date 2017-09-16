class UrlmapperDecorator < Draper::Decorator
  delegate_all

  def tiny_url
   	object.tinyurl
  end
end
