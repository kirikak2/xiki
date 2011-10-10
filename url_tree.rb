class UrlTree
  def self.handles? list
    list.first =~ /^http:\/\//
  end

  def self.launch options={}
    url = options[:path].join("")
    Keys.prefix_u ? $el.browse_url(url) : Firefox.url(url)
  end
end

Launcher.add "urls" do |path|
  url = path[/urls\/(.+)/, 1]
  Keys.prefix == :u ? browse_url(url) : Firefox.url(url)
  nil
end
