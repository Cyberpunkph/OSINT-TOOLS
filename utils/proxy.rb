def get_proxy(use_tor)
  return nil unless use_tor
  { host: "127.0.0.1", port: 9050 }
end
