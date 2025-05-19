Then('I should be on the Not-Registered Dashboard page') do
  expect(@current_page).to be_a(NoRegisterPage), "Current page expected to be a NoRegister but wasn't"
end

When('I click the {string} option') do |opt|
  @current_page = @login_page.click_no_register_option
  expect(@current_page.on_not_registered_dashboard?).to eq(true)
end

When('I click the {string} module') do |module_name|
  @current_page.click_module(module_name)
end

Then('I should see a warning {string}') do |msg|
  expect(@current_page.warning_message_visible?).to eq(true)
end

Then('I should be redirected to the {string} module') do |module_name|
   expect(@current_page.on_module_page?(module_name)).to eq(true)
    "Expected URL to include path for '#{module_name}', but was #{@browser.url}"
end
