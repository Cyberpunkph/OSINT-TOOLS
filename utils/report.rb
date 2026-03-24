def generate_html(results)
  html = "<html><body><h1>OSINT Report</h1>"
  results.each do |r|
    html += "<p>#{r[:site]} - #{r[:url]}</p>"
  end
  html += "</body></html>"
  File.write("output/report.html", html)
end
