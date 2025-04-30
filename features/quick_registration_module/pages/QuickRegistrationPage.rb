class QuickRegistrationPage

    def initialize(browser)
      @browser = browser
    end
  
    def on_quick_registration_page?
      @browser.url.include?("formulariofast")
    end
  
    def load_elements
      @form = QuickRegistrationForm.new(@browser)
      @card = QuickRegistrationCard.new(@browser)
      @form.load_form_elements
      @card.load_card_elements
    end
  
    def is_register_button_enabled?
      @form.is_button_enabled?
    end

    def fill_form(values)
      @form.fill_form(values)
    end

    def check_terms
      @form.click_terms_checkbox
    end

    def send_form
      @form.click_register_button
    end

    def is_form_hidden?
      @form.is_form_hidden?
    end

    def is_info_card_displayed?
      @card.is_card_displayed?
    end
  
    def get_field_message_for(field_name)
      @form.get_field_message(field_name)
    end

    def get_info_card_title
      @card.get_card_title
    end

    def correct_username_registration?
      @form.get_form_username == @card.get_card_username
    end

    def accept_registration
      @card.click_accept_button
      return LoginPage.new(@browser)
    end

    def add_new_user_to_excel
      @form.add_new_user_to_excel
    end

    def accept_failed_registration
      @card.click_accept_button
    end
end