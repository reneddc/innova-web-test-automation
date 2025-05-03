Feature: Validate the Quick Registration using all the form fields

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page


   
  @onlyThis
  Scenario Outline: INW-1 - Quick Registration with valid data in all the fields
    Given I am on the 'Quick Registration' page
    When I fill the 'Quick Registration' form with the following values
      | Document Number   | <DocumentNumber>  |
      | Cellphone         | <Cellphone>       |
      | Names             | <Names>           |
      | First Surname     | <FirstSurname>    |
      | Second Surname    | <SecondSurname>   |
      | Email             | <Email>           |
      | Password          | <Password>        |
      | Repeat Password   | <RepeatPassword>  |
    And I check the "Terms and Conditions" checkbox
    And The 'Register' button turns to enabled
    And I click the 'Register' button
    Then The information card should be displayed
    And I should be successfully registered in the INNOVA system
    And I accept the successful registration message
    And I should be redirected to the 'Log In' page

    Examples:
      | DocumentNumber | Cellphone     | Names     | FirstSurname   | SecondSurname  | Email                     | Password   | RepeatPassword |
      | 66000001       | 66000001      | NOMBREI   | PRIAPELLIDOI   | SEGAPELLIDOI   | 66000001test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




  @onlyThis
  Scenario Outline: INW-2 - Quick Registration without checking the terms and conditions
    Given I am on the 'Quick Registration' page
    When I fill the 'Quick Registration' form with the following values
      | Document Number   | <DocumentNumber>  |
      | Cellphone         | <Cellphone>       |
      | Names             | <Names>           |
      | First Surname     | <FirstSurname>    |
      | Second Surname    | <SecondSurname>   |
      | Email             | <Email>           |
      | Password          | <Password>        |
      | Repeat Password   | <RepeatPassword>  |
    And The 'Register' button is disabled
    And I click the 'Register' button
    Then The form should not be sent
    And The information card should not be displayed
    And The user should still on the 'Quick Registration' page

    Examples:
      | DocumentNumber | Cellphone     | Names     | FirstSurname    | SecondSurname   | Email                     | Password   | RepeatPassword |
      | 66000002       | 66000002      | NOMBREII  | PRIAPELLIDOII   | SEGAPELLIDOII   | 66000002test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




  @onlyThis
  Scenario: INW-3 - Quick Registration with only empty fields
    Given I am on the 'Quick Registration' page
    When I click the 'Register' button
    Then The form should not be sent
    And The information card should not be displayed
    And The user should still on the 'Quick Registration' page




 @onlyThis
  Scenario: INW-4 - Quick Registration with only empty fields and checking terms of conditions
    Given I am on the 'Quick Registration' page
    When I check the "Terms and Conditions" checkbox
    And The 'Register' button turns to enabled
    And I click the 'Register' button
    Then The information card should be displayed
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page



  @onlyThis
  Scenario Outline: INW-5 - Quick Registration filling only the optional fields
    Given I am on the 'Quick Registration' page
    When I fill the 'Quick Registration' form with the following values
      | Document Number   | <DocumentNumber>  |
      | Cellphone         | <Cellphone>       |
      | Names             | <Names>           |
      | First Surname    | <FirstSurname>   |
      | Second Surname   | <SecondSurname>  |
      | Email             | <Email>           |
      | Password          | <Password>        |
      | Repeat Password   | <RepeatPassword>  |
    And I check the "Terms and Conditions" checkbox
    And The 'Register' button turns to enabled
    And I click the 'Register' button
    Then The information card should be displayed
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The following fields should display the "Empty Field" error message
      | Document Number |
      | Names           |
      | First Surname   |
      | Cellphone       |
      | Email           |
      | Password        |
      | Repeat Password |

    Examples:
      | DocumentNumber  | Cellphone | Names           | FirstSurname        | SecondSurname         | Email                   | Password    | RepeatPassword  |
      | ""              | ""        | ""              | ""                  | SEGAPELLIDOV          | ""                      | ""          | ""              |



  @onlyThis 
  Scenario Outline: INW-6 - Quick Registration filling only the mandatory fields
    Given I am on the 'Quick Registration' page
    When I fill the 'Quick Registration' form with the following values
      | Document Number   | <DocumentNumber>  |
      | Cellphone         | <Cellphone>       |
      | Names             | <Names>           |
      | First Surname     | <FirstSurname>    |
      | Second Surname    | <SecondSurname>   |
      | Email             | <Email>           |
      | Password          | <Password>        |
      | Repeat Password   | <RepeatPassword>  |
    And I check the "Terms and Conditions" checkbox
    And The 'Register' button turns to enabled
    And I click the 'Register' button
    Then The information card should be displayed
    And I should be successfully registered in the INNOVA system
    And I accept the successful registration message
    And I should be redirected to the 'Log In' page

    Examples:
    | DocumentNumber | Cellphone     | Names     | FirstSurname    | SecondSurname   | Email                     | Password   | RepeatPassword |
    | 66000006       | 66000006      | NOMBREVI  | PRIAPELLIDOVI   | ""              | 66000006test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |   