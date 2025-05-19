Feature: Login validation

  Background:
    Given I am on the Login page


@smokeTest 
  Scenario: Successful login with correct credentials
    When I enter email "66000001test@gmail.com"
    And I enter password "Aaaaaaaaa1"
    And I click the Login button
    Then I should be redirected to the dashboard


@smokeTest 
  Scenario: Show error messages when email and password fields are empty
    When I leave the email and password fields empty
    And I click the Login button
    Then I should see "Email es obligatorio" below the email field
    And I should see "Password es obligatorio" below the password field


@smokeTest 
  Scenario: Valid email and empty password shows error
    When I enter email "66000001test@gmail.com"
    And I leave the password field empty
    And I click the Login button
    Then I should see "Password es obligatorio" below the password field


@smokeTest 
  Scenario: Unregistered email with any password shows authentication error
    When I enter email "noexistente@correo.com"
    And I enter password "cualquiera"
    And I click the Login button
    Then I should see "Error en los datos de autenticación" below the password field


@smokeTest 
  Scenario: Incorrect password for registered email shows error
    When I enter email "66000001test@gmail.com"
    And I enter password "incorrecta"
    And I click the Login button
    Then I should see "Error en los datos de la autentificación" below the password field

@smokeTest 
  Scenario: Redirects to login page after logout
    Given I login with email "66000001test@gmail.com" and password "Aaaaaaaaa1"
    And I log out
    When I reopen the application
    Then I should be on the Login page
