def detect_account(response, site)
  code = response.code.to_i
  case site["errorType"]
  when "status_code"
    code == 200
  else
    false
  end
end
