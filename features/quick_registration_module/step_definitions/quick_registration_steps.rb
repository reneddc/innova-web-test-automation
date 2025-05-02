#Background steps
Given("I am on the Log In page of INNOVA") do
    @current_page = LoginPage.new(@browser)
    @current_page.visit
end
  
When("I press the 'Quick Registration' option") do
    @current_page = @current_page.click_quick_register_option
end
  
Then("I am redirected to the 'Quick Registration' page") do
    expect(@current_page).to be_a(QuickRegistrationPage), "Current page expected to be a QuickRegistrationPage, but wasn't"
end

# Scenario steps
Given("I am on the 'Quick Registration' page") do
    expect(@current_page.on_quick_registration_page?).to eq(true), "Expected to be on Quick Registration page, but wasn't"
    @current_page.load_elements
    expect(@current_page.is_register_button_enabled?).to eq(false), "Register button expected to be disabled at the begin, but wasn't"
end

When(/I (?:fill|replace) the 'Quick Registration' form with the following values/) do |table|
    @current_page.fill_form(table.rows_hash)
end
  
When(/^I check the "Terms and Conditions" checkbox$/) do
    @current_page.check_terms
end

When("The 'Register' button turns to enabled") do
    expect(@current_page.is_register_button_enabled?).to eq(true), "Register button expected to get enabled, but wasn't"
end

When("I click the 'Register' button") do
    @current_page.send_form
end

Then("The information card should be displayed") do
    begin
      expect(@current_page.is_info_card_displayed?).to eq(true), "Expected info card to be displayed"
      expect(@current_page.is_form_hidden?).to eq(true), "Expected form to be sent"
    rescue RSpec::Expectations::ExpectationNotMetError => e
      if @current_page.get_field_message_for("Email").include?("ya existe") || @current_page.get_field_message_for("Document Number").include?("ya se encuentra registrado")
        @current_page.add_new_user_to_excel
      end

      log @current_page.get_field_message_for("Document Number")
      log @current_page.get_field_message_for("Names")
      log @current_page.get_field_message_for("First Surname")
      log @current_page.get_field_message_for("Second Surname")
      log @current_page.get_field_message_for("Cellphone")
      log @current_page.get_field_message_for("Email")
      log @current_page.get_field_message_for("Password")
      log @current_page.get_field_message_for("Repeat Password")
      raise e.message
    end
  end

And("I should be successfully registered in the INNOVA system") do
    current_card_title = @current_page.get_info_card_title
    expect(current_card_title).to(include(CARD_TITLES[:success_register]), "Expected info card title to include '#{CARD_TITLES[:success_register]}', but got '#{current_card_title}'")
    @current_page.add_new_user_to_excel
    expect(@current_page.correct_username_registration?).to eq(true), "Expected username_registration to be correct, but wasn't"
    
end

And("I accept the successful registration message") do
    @current_page = @current_page.accept_registration
end

And("I should be redirected to the 'Log In' page") do
    expect(@current_page).to be_a(LoginPage), "Current page expected to be a LoginPage, but wasn't"
    expect(@current_page.on_login_page?).to eq(true), "Expected to be on Login page, but wasn't"
end

And("The 'Register' button is disabled") do
    expect(@current_page.is_register_button_enabled?).to eq(false), "Register button expected to be disabled, but wasn't"
end

Then("The information card should not be displayed") do
    begin
        expect(@current_page.is_info_card_displayed?).to eq(false), "Information card expected to be hidden, but it´s displayed"
    rescue RSpec::Expectations::ExpectationNotMetError => e
        if @current_page.get_info_card_title.include?("Ciudadano registrado")
            log "User registred succesfuly when it shouldn't be"
            @current_page.add_new_user_to_excel
        end
        raise e.message
    end
end

Then("The form should not be sent") do
    expect(@current_page.is_form_hidden?).to eq(false), "Expected body-div don't be hidden, but it was"
end

Then("The user should still on the 'Quick Registration' page") do
    expect(@current_page).to be_a(QuickRegistrationPage), "Current page expected to be a QuickRegistrationPage, but wasn't"
    expect(@current_page.on_quick_registration_page?).to eq(true), "Expected to be on Quick Rgistration page, but wasn't"
    if @current_page.get_field_message_for("Email").include?("ya existe") || @current_page.get_field_message_for("Document Number").include?("ya se encuentra registrado")
        @current_page.add_new_user_to_excel
    end
end

Then("The quick registration attempt should fail") do
    is_card_displayed = @current_page.is_info_card_displayed? #if card is not displayed, the register already failed
    if is_card_displayed # if card is displayed, we expect that the register fail
      current_card_title = @current_page.get_info_card_title
      expect(current_card_title).not_to include(CARD_TITLES[:success_register]),
                                        "Expected the info card not to indicate a successful registration, but got '#{current_card_title}'"
    end
  end

Then("I accept the failed registration message") do
    @current_page.accept_failed_registration
end


And(/^The following fields should display the "(.*)" error message$/) do |error_type,table|
    table.raw.flatten.each do |field|
        expected_message = FIELDS_MESSAGES[field][error_type]
      expected_message = FIELDS_MESSAGES[field][error_type]
      current_message = @current_page.get_field_message_for(field)
      expect(current_message).to eq(expected_message),
                                 "Expected field message for #{field}: #{expected_message}. But got: '#{current_message}'"
    end
end


And(/^The following fields should contain the "(.*)" error message$/) do |error_type, table|
    table.raw.flatten.each do |field|
      expected_message = FIELDS_MESSAGES[field][error_type]
      current_message = @current_page.get_field_message_for(field)
      expect(current_message).to(include(expected_message), 
                                "Expected field message for #{field} contains: #{expected_message}. But got: '#{current_message}'")                   
    end
end


And(/^The field "(.*)" should contain the following error messages$/) do |field, table|
    table.raw.flatten.each do |error_type|
      expected_message = FIELDS_MESSAGES[field][error_type]
      current_message = @current_page.get_field_message_for(field)
      expect(current_message).to(include(expected_message), 
                                "Expected field message for #{field} contains: #{expected_message}. But got: '#{current_message}'")                   
    end
end


