require 'net/http'
require 'uri'
require_relative 'proxy'

def http_request(url, use_tor: false)
  uri = URI(url)
  proxy = get_proxy(use_tor)

  http = proxy ? Net::HTTP::Proxy(proxy[:host], proxy[:port]).new(uri.host, uri.port) : Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == "https")

  request = Net::HTTP::Get.new(uri)
  request["User-Agent"] = "Mozilla/5.0"

  http.request(request)
end
