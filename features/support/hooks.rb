require_relative 'report_generator'
require_relative 'helpers'



Before do
  @browser = Watir::Browser.new :chrome
end

After do |scenario|
  @browser.close
end


