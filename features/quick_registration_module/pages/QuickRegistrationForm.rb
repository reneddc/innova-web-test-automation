include Helpers

class QuickRegistrationForm

  def initialize(browser)
    @browser = browser
  end

  def load_form_elements
    @form_div = @browser.div(xpath: '/html/body/div')
    @document_number = @browser.text_field(id: 'nro_documento')
    @names = @browser.text_field(id: 'nombres')
    @first_surname = @browser.text_field(id: 'ap_primero')
    @second_surname = @browser.text_field(id: 'ap_segundo')
    @cellphone = @browser.text_field(id: 'celular')
    @email = @browser.text_field(id: 'correo')
    @password = @browser.text_field(id: 'password')
    @repeat_password = @browser.text_field(id: 'repeat_pass')
    @terms_checkbox = @browser.label(xpath: '/html/body/div/div/div[2]/div/div/form/div/div[9]/label')
    @register_button = @browser.button(id: 'btn-registrar')
  end

  def is_button_enabled?
    @register_button.enabled?
  end

  def fill_form(values)
    values = values.to_h.transform_values do |value|
      clean_quotes(value)
    end
    @document_number.set(values['Document Number'])
    @names.set(values['Names'])
    @first_surname.set(values['First Surname'])
    @second_surname.set(values['Second Surname'])
    @cellphone.set(values['Cellphone'])
    @email.set(values['Email'])
    @password.set(values['Password']) 
    @repeat_password.set(values['Repeat Password'])
  end

  def click_terms_checkbox
    @terms_checkbox.click
  end

  def click_register_button
    original_timeout = Watir.default_timeout
    Watir.default_timeout = 1
    begin
      @register_button.click
    rescue Watir::Exception::ObjectDisabledException
      puts "Intentaste hacer clic en un botón deshabilitado."
    ensure
      Watir.default_timeout = original_timeout
    end
  end

  def is_form_hidden?
    form_visible = @form_div.attribute_value("aria-hidden")
    return form_visible == 'true'
  end

  def find_field_error_message(div_number)
    field_message = @browser.span(xpath: "/html/body/div/div/div[2]/div/div/form/div/div[#{div_number}]/div[2]/div/span")
    field_message.wait_until(timeout: 0.5, message: "Field message didn't appear")
    
    if field_message.exists?
      return field_message.text
    else
      return "The Field #{div_number} doesn't have error message"
    end
  rescue Watir::Exception::UnknownObjectException
    return "The Field #{div_number} doesn't have error message"
  end
  
  def get_field_message(field_name)
    case field_name
      when "Document Number"
        find_field_error_message(1)
      when "Names"
        find_field_error_message(2)
      when "First Surname"
        find_field_error_message(3)
      when "Second Surname"
        find_field_error_message(4)
      when "Cellphone"
        find_field_error_message(5)  
      when "Email"
        find_field_error_message(6) 
      when "Password"
        find_field_error_message(7)
      when "Repeat Password"
        find_field_error_message(8)
    else
      raise ArgumentError, "Unsupported field name: #{field_name}"
    end
  end

  def add_new_user_to_excel
    user_registered = UserRegistered.new
    user_registered.register_user(@document_number.value, @email.value, @cellphone.value, @password.value)
  end

  def get_form_username
    fullname_filled = "#{@names.value} #{@first_surname.value}"
    unless @second_surname.value.empty?
      fullname_filled += " #{@second_surname.value}"
    end
    return fullname_filled
  end

end