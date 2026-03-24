def detect_account(response, site)
  code = response.code.to_i
  body = response.body.to_s

  case site["errorType"]
  when "status_code"
    code == 200

  when "message"
    !body.include?(site["errorMsg"])

  when "redirect"
    [200, 301, 302].include?(code)

  when "regex"
    !(body =~ Regexp.new(site["errorMsg"]))

  else
    false
  end
end
