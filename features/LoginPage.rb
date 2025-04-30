class LoginPage

    def initialize(browser)
      @browser = browser
    end
  
    def visit
      @browser.goto('https://innovadev.cochabamba.bo/login')
    end
  
    def load_elements
      @quick_registration_option = @browser.link(xpath: '/html/body/div/div[1]/div[2]/div/div/div[3]/p/a')
    end
  
    def on_login_page?
      @browser.url.include?("login")
    end
  
    def click_quick_register_option
      load_elements
      @quick_registration_option.click
      return QuickRegistrationPage.new(@browser)
    end
  
end