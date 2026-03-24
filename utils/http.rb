require 'net/http'
require 'uri'
require_relative 'proxy'

def http_request(url, use_tor: false, retries: 2)
  uri = URI(url)
  proxy = get_proxy(use_tor)

  http = if proxy
           Net::HTTP::Proxy(proxy[:host], proxy[:port]).new(uri.host, uri.port)
         else
           Net::HTTP.new(uri.host, uri.port)
         end

  http.use_ssl = (uri.scheme == "https")
  http.open_timeout = 10
  http.read_timeout = 10

  request = Net::HTTP::Get.new(uri)

  # 🔥 random user agent
  request["User-Agent"] = [
    "Mozilla/5.0",
    "Chrome/120.0",
    "Safari/537.36",
    "Edge/120.0"
  ].sample

  begin
    http.request(request)
  rescue
    retry if (retries -= 1) > 0
    raise
  end
end
