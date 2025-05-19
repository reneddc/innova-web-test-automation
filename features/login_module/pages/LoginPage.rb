class LoginPage
  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto('https://innovadev.cochabamba.bo/login')
  end

  def load_elements
    @quick_registration_option = @browser.link(xpath: '/html/body/div/div[1]/div[2]/div/div/div[3]/p/a')
    @email_input = @browser.text_field(xpath: '/html/body/div/div[1]/div[2]/form/div/div[1]/input')
    @password_input = @browser.text_field(xpath: '/html/body/div/div[1]/div[2]/form/div/div[2]/input')
    @login_button = @browser.button(xpath: '/html/body/div/div[1]/div[2]/form/div/div[4]/div/button')
    @no_register_button = @browser.link(xpath: '/html/body/div/div[1]/div[2]/form/div/div[5]/div/p/a')
  end

  def on_login_page?
    @browser.url.include?("login")
  end

  def click_quick_register_option
    load_elements
    @quick_registration_option.click
    return QuickRegistrationPage.new(@browser)
  end

  def click_no_register_option
    load_elements
    @no_register_button.click
    return NoRegisterPage.new(@browser)
  end

  def enter_email(email)
    @email_input.set(email)
  end

  def enter_password(password)
    @password_input.set(password)
  end

  def click_login
    @login_button.click
  end

  def email_error_message
    email_error = @browser.span(xpath: '/html/body/div/div[1]/div[2]/form/div/div[1]/div[2]/span')
    email_error.exists? ? email_error.text.strip : nil
  end

  def password_error_message
    pass_error = @browser.span(xpath: '/html/body/div/div[1]/div[2]/form/div/div[2]/div[2]/span')
    pass_error.exists? ? pass_error.text.strip : nil
  end

  def on_dashboard_page?
    @browser.url.include?("/dashboard") || @browser.url.include?("/home")
  end

  def logout
    @browser.img(xpath: '/html/body/div/nav/ul[2]/li[4]/a/img').click

    @browser.link(xpath: '/html/body/div/nav/ul[2]/li[4]/ul/li[2]/a')
            .wait_until(&:present?)
            .click
  end
end
