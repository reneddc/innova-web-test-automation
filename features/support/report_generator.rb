require 'fileutils'
require 'cgi'

module ReportGenerator
  REPORT_DIR = 'features/reports'
  REPORT_FILE = File.join(REPORT_DIR, 'execution_report.html')

  @scenarios = []

# report_generator.rb

def self.append_scenario_result(scenario, logs = [])
  @scenarios ||= []
  @scenarios << {
    name: CGI.escapeHTML(scenario.name),
    status: scenario.passed? ? 'PASÓ' : 'FALLÓ',
    color: scenario.passed? ? 'green' : 'red',
    error: scenario.exception ? CGI.escapeHTML(scenario.exception.message).gsub("\n", '<br>') : '',
    logs: logs
  }
end

def self.finalize_report
  File.open(REPORT_FILE, 'a') do |file|
    @scenarios.each do |scenario|
      file.puts "<h3>#{scenario[:name]}</h3>"
      file.puts "<p style='color: #{scenario[:color]}; font-weight: bold;'>#{scenario[:status]}</p>"
      file.puts "<p>#{scenario[:error]}</p>" if scenario[:error]
      file.puts "<div>#{scenario[:logs]}</div>"  # Los logs del escenario
    end
    file.puts "</body></html>"
  end
end
end
