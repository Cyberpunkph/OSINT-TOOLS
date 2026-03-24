def generate_html(results)
  html = <<~HTML
  <html>
  <body style="background:#0f172a;color:white;font-family:Arial">
  <h1>OSINT Report</h1>
  HTML

  results.each do |r|
    html += "<p>#{r[:site]} → <a href='#{r[:url]}'>#{r[:url]}</a></p>"
  end

  html += "</body></html>"

  File.write("output/report.html", html)
end
