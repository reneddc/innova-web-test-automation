class QuickRegistrationCard

  def initialize(browser)
      @browser = browser
  end

  def load_card_elements
      @card_title = @browser.h2(id: 'swal2-title')
      @card_message = @browser.h4(xpath: '/html/body/div[2]/div/div[2]/h4[1]')
      @button = @browser.button(xpath: '/html/body/div[2]/div/div[6]/button[1]')
  end

  def is_card_displayed?
    @card = @browser.div(css: 'body > div.swal2-container.swal2-center.swal2-backdrop-show')
    #return false unless @card.exists?

    @card.wait_until(timeout: 1, &:present?)  # espera mínima
    true
  rescue Watir::Wait::TimeoutError
    false
  end

  def get_card_title
    return @card_title.text
  end

  def get_card_username
    @card_message.text
  end
  
  def click_accept_button
    @button.click
  end

end

