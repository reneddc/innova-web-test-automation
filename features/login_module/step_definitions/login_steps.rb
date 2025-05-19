Given("I am on the Login page") do
  @login_page = LoginPage.new(@browser)
  @login_page.visit
  @login_page.load_elements
end

When('I enter email {string}') do |email|
  @login_page.load_elements
  @login_page.enter_email(email)
end

When('I enter password {string}') do |password|
  @login_page.enter_password(password)
end

When('I leave the email and password fields empty') do
  @login_page.load_elements
  @login_page.enter_email('')
  @login_page.enter_password('')
end

When('I leave the password field empty') do
  @login_page.enter_password('')
end

When('I click the Login button') do
  @login_page.click_login
end

Then('I should be redirected to the dashboard') do
  expect(@login_page.on_dashboard_page?).to be true
end

Then('I should see {string} below the email field') do |expected_message|
  actual = @login_page.email_error_message
  expect(actual).to eq(expected_message)
end

Then('I should see {string} below the password field') do |expected_message|
  actual = @login_page.password_error_message
  expect(actual).to eq(expected_message)
end

Given('I login with email {string} and password {string}') do |email, password|
  step 'I am on the Login page'
  @login_page.enter_email(email)
  @login_page.enter_password(password)
  @login_page.click_login
end

Given('I log out') do
  @login_page.logout
end

When('I reopen the application') do
  @login_page.visit
end

Then('I should be on the Login page') do
  expect(@login_page.on_login_page?).to be true
end
