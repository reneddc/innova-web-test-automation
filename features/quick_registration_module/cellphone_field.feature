Feature: Validate the Quick registration focused on "Cellphone" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page

  

  Scenario Outline: INW-23 - Quick Registration attempt with missing cellphone field
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
    Then The information card should not be displayed
    And The quick registration attempt should fail
    And The user should still on the 'Quick Registration' page
    And The following fields should display the "Empty field" error message
      | Cellphone |

    Examples:
        | DocumentNumber  | Cellphone | Names           | FirstSurname        | SecondSurname           | Email                   | Password    | RepeatPassword  |
        | 66000056        | ""        | NOMBRELVI       | PRIAPELLIDOLVI      | SEGAPELLIDOLVI          | 66000056test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1      |
