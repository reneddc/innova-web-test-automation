Feature: Validate the Quick registration focused on "Document Number" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page

  
  @smokeTest
  Scenario Outline: INW-12 - Quick Registration attempt with missing document number
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
    And The following fields should display the "Empty Field" error message
      | Document Number |

    Examples:
      | DocumentNumber  | Cellphone | Names           | FirstSurname        | SecondSurname         | Email                   | Password    | RepeatPassword  |
      | ""              | 66000013  | NOMBREXIII      | PRIAPELLIDOXIII     | SEGAPELLIDOXIII       | 66000013test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1      |




Scenario Outline: INW-13 - Quick registration with valid alphanumeric "Document Number"
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
        | DocumentNumber | Cellphone     | Names      | FirstSurname     | SecondSurname    | Email                     | Password   | RepeatPassword |
        | 660014AA       | 66000014      | NOMBREXIV  | PRIAPELLIDOXIV   | SEGAPELLIDOXIV   | 66000014test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AA660015       | 66000015      | NOMBREXV   | PRIAPELLIDOXV    | SEGAPELLIDOXV    | 66000015test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000016A      | 66000016      | NOMBREXVI  | PRIAPELLIDOXVI   | SEGAPELLIDOXVI   | 66000016test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | A66000017      | 66000017      | NOMBREXVII | PRIAPELLIDOXVII  | SEGAPELLIDOXVII  | 66000017test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 6600001-8A     | 66000018      | NOMBREXVIII| PRIAPELLIDOXVIII | SEGAPELLIDOXVIII | 66000018test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AA-AA66000019  | 66000019      | NOMBREXIX  | PRIAPELLIDOXIX   | SEGAPELLIDOXIX   | 66000019test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




#@onlyThis
Scenario Outline: INW-14 - Quick registration with invalid alphabetic characters in "Document Number"
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
    And The following fields should contain the "Invalid Alphabetic Characters" error message
        | Document Number |

    Examples:
        | DocumentNumber  | Cellphone     | Names           | FirstSurname      | SecondSurname      | Email                     | Password   | RepeatPassword |
        | AAAABBBB        | 66000020      | NOMBREXX        | PRIAPELLIDOXX     | SEGAPELLIDOXX      | 66000020test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AAAA6621        | 66000021      | NOMBREXXI       | PRIAPELLIDOXXI    | SEGAPELLIDOXXI     | 66000021test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 6622AAAA        | 66000022      | NOMBREXXII      | PRIAPELLIDOXXII   | SEGAPELLIDOXXII    | 66000022test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AA6623AA        | 66000023      | NOMBREXXIII     | PRIAPELLIDOXXIII  | SEGAPELLIDOXXIII   | 66000023test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | A2A2A2A2        | 66000024      | NOMBREXXIV      | PRIAPELLIDOXXIV   | SEGAPELLIDOXXIV    | 66000024test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AAAABBBB-AB     | 66000025      | NOMBREXXV       | PRIAPELLIDOXXV    | SEGAPELLIDOXXV     | 66000025test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | AB-AAAABBBB     | 66000026      | NOMBREXXVI      | PRIAPELLIDOXXVI   | SEGAPELLIDOXXVI    | 66000026test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66-AAAABBBB     | 66000027      | NOMBREXXVII     | PRIAPELLIDOXXVII  | SEGAPELLIDOXXVII   | 66000027test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-15 - Quick registration with valid special characters in "Document Number"
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
        | DocumentNumber  | Cellphone     | Names        | FirstSurname       | SecondSurname       | Email                     | Password   | RepeatPassword |
        | 66000028-1      | 66000028      | NOMBREXXVIII | PRIAPELLIDOXXVIII  | SEGAPELLIDOXXVIII   | 66000028test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 1-66000029      | 66000029      | NOMBREXXIX   | PRIAPELLIDOXXIX    | SEGAPELLIDOXXIX     | 66000029test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-16 - Quick registration with invalid special characters in "Document Number"
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
    And The following fields should contain the "Invalid Special Characters" error message
        | Document Number |

    Examples:
        | DocumentNumber        | Cellphone     | Names          | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
        | --------              | 66000030      | NOMBREXXX      | PRIAPELLIDOXXX      | SEGAPELLIDOXXX       | 66000030test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | (66000031)            | 66000031      | NOMBREXXXI     | PRIAPELLIDOXXXI     | SEGAPELLIDOXXXI      | 66000031test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 6600-0032             | 66000032      | NOMBREXXXII    | PRIAPELLIDOXXXII    | SEGAPELLIDOXXXII     | 66000032test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000033--1           | 66000033      | NOMBREXXXIII   | PRIAPELLIDOXXXIII   | SEGAPELLIDOXXXIII    | 66000033test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000034.2            | 66000034      | NOMBREXXXIV    | PRIAPELLIDOXXXIV    | SEGAPELLIDOXXXIV     | 66000034test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | $66000035             | 66000035      | NOMBREXXXV     | PRIAPELLIDOXXXV     | SEGAPELLIDOXXXV      | 66000035test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 😀😀😀😀😀😀😀😀  | 66000036      | NOMBREXXXVI    | PRIAPELLIDOXXXVI    | SEGAPELLIDOXXXVI     | 66000036test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | ++++++++              | 66000037      | NOMBREXXXVII   | PRIAPELLIDOXXXVII   | SEGAPELLIDOXXXVII    | 66000037test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |


#@onlyThis
Scenario Outline: INW-17 - Quick registration with space characters in "Document Number"
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
    And The following fields should contain the "Space Characters" error message
        | Document Number |

    Examples:
        | DocumentNumber    | Cellphone     | Names           | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
        | "66·000038"       | 66000038      | NOMBREXXXVIII   | PRIAPELLIDOXXXVIII   | SEGAPELLIDOXXXVIII    | 66000038test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "6600··0039"      | 66000039      | NOMBREXXXIX     | PRIAPELLIDOXXXIX     | SEGAPELLIDOXXXIX      | 66000039test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "66·00·00·40"     | 66000040      | NOMBREXL        | PRIAPELLIDOXL        | SEGAPELLIDOXL         | 66000040test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "········"        | 66000041      | NOMBREXLI       | PRIAPELLIDOXLI       | SEGAPELLIDOXLI        | 66000041test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "6······2"        | 66000042      | NOMBREXLII      | PRIAPELLIDOXLII      | SEGAPELLIDOXLII       | 66000042test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "····6643"        | 66000043      | NOMBREXLIII     | PRIAPELLIDOXLIII     | SEGAPELLIDOXLIII      | 66000043test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "6644····"        | 66000044      | NOMBREXLIV      | PRIAPELLIDOXLIV      | SEGAPELLIDOXLIV       | 66000044test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "6········"       | 66000045      | NOMBREXLV       | PRIAPELLIDOXLV       | SEGAPELLIDOXLV        | 66000045test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | "·······6"        | 66000046      | NOMBREXLVI      | PRIAPELLIDOXLVI      | SEGAPELLIDOXLVI       | 66000046test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-18 - Quick registration with insufficient characters in "Document Number"
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
    And The following fields should contain the "Insufficient Characters" error message
        | Document Number |

    Examples:
      | DocumentNumber   | Cellphone     | Names           | FirstSurname          | SecondSurname          | Email                     | Password   | RepeatPassword |
      | 647              | 66000047      | NOMBREXLVII     | PRIAPELLIDOXLVII      | SEGAPELLIDOXLVII       | 66000047test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |


#@onlyThis
Scenario Outline: INW-19 - Quick registration with too many characters in "Document Number"
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
    And The following fields should contain the "Too Many Characters" error message
        | Document Number |

    Examples:
    | DocumentNumber        | Cellphone     | Names           | FirstSurname           | SecondSurname           | Email                     | Password   | RepeatPassword |
    | 6600000000000048      | 66000048      | NOMBREXLVIII     | PRIAPELLIDOXLVIII      | SEGAPELLIDOXLVIII       | 66000048test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



#@onlyThis
Scenario Outline: INW-20 - Quick registration with edge characters in "Document Number"
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
      | DocumentNumber        | Cellphone     | Names       | FirstSurname       | SecondSurname       | Email                     | Password   | RepeatPassword |
      | 660000000000049       | 66000049      | NOMBREXLIX  | PRIAPELLIDOXLIX    | SEGAPELLIDOXLIX     | 66000049test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 6650                  | 66000050      | NOMBREL     | PRIAPELLIDOL       | SEGAPELLIDOL        | 66000050test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |


#@onlyThis
Scenario Outline: INW-21 - Quick registration changing invalid "Document Number" to a valid one
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
    And I replace the 'Quick Registration' form with the following values
      | Document Number   | <DocumentNumberChanged>  |
      | Cellphone         | <CellphoneChanged>       |
      | Names             | <NamesChanged>           |
      | First Surname     | <FirstSurnameChanged>    |
      | Second Surname    | <SecondSurnameChanged>   |
      | Email             | <EmailChanged>           |
      | Password          | <PasswordChanged>        |
      | Repeat Password   | <RepeatPasswordChanged>  |
    And I click the 'Register' button
    Then The information card should be displayed
    And I should be successfully registered in the INNOVA system
    And I accept the successful registration message
    And I should be redirected to the 'Log In' page

    Examples:
      | DocumentNumber      | Cellphone  | Names      | FirstSurname    | SecondSurname    | Email                  | Password   | RepeatPassword | DocumentNumberChanged | CellphoneChanged | NamesChanged | FirstSurnameChanged | SecondSurnameChanged | EmailChanged            | PasswordChanged | RepeatPasswordChanged |
      | 660000000000000051  | 66000051   | NOMBRELI   | PRIAPELLIDOLI   | SEGAPELLIDOLI    | 66000051@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000051              | 66000051         | NOMBRELI     | PRIAPELLIDOLI        | SEGAPELLIDOLI         | 66000051@gmail.com      | Aaaaaaaaa1      | Aaaaaaaaa1           |
      | ""                  | 66000052   | NOMBRELII  | PRIAPELLIDOLII  | SEGAPELLIDOLII   | 66000052@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000052              | 66000052         | NOMBRELII    | PRIAPELLIDOLII       | SEGAPELLIDOLII        | 66000052@gmail.com      | Aaaaaaaaa1      | Aaaaaaaaa1           |
      | 6                   | 66000053   | NOMBRELIII | PRIAPELLIDOLIII | SEGAPELLIDOLIII  | 66000053@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000053              | 66000053         | NOMBRELIII   | PRIAPELLIDOLIII      | SEGAPELLIDOLIII       | 66000053@gmail.com      | Aaaaaaaaa1      | Aaaaaaaaa1           |
      | 76                  | 76000053   | NOMBRELIII | PRIAPELLIDOLIII | SEGAPELLIDOLIII  | qq66000053@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     | 76000053              | 76000053         | NOMBRELIII   | PRIAPELLIDOLIII      | SEGAPELLIDOLIII       | qq66000053@gmail.com      | Aaaaaaaaa1      | Aaaaaaaaa1           |
      | 77                  | 77000053   | NOMBRELIII | PRIAPELLIDOLIII | SEGAPELLIDOLIII  | qq66000053@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     | 77000053              | 77000053         | NOMBRELIII   | PRIAPELLIDOLIII      | SEGAPELLIDOLIII       | qqq66000053@gmail.com      | Aaaaaaaaa1      | Aaaaaaaaa1           |



@smokeTest
#@onlyThis
Scenario Outline: INW-22 - Quick registration entering a previously registered "Document Number"
    Given I am on the 'Quick Registration' page
    And I fill the 'Quick Registration' form with the following values
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
    And The information card should be displayed
    And I should be successfully registered in the INNOVA system
    And I accept the successful registration message
    And I should be redirected to the 'Log In' page
    And I press the 'Quick Registration' option
    And I am redirected to the 'Quick Registration' page
    And I am on the 'Quick Registration' page
    When I fill the 'Quick Registration' form with the following values
      | Document Number   | <NewDocumentNumber>  |
      | Cellphone         | <NewCellphone>       |
      | Names             | <NewNames>           |
      | First Surname     | <NewFirstSurname>    |
      | Second Surname    | <NewSecondSurname>   |
      | Email             | <NewEmail>           |
      | Password          | <NewPassword>        |
      | Repeat Password   | <NewRepeatPassword>  |
    And I check the "Terms and Conditions" checkbox
    And The 'Register' button turns to enabled
    And I click the 'Register' button
    Then The information card should not be displayed
    And The quick registration attempt should fail
    And The user should still on the 'Quick Registration' page
    And The following fields should display the "Already Registered" error message
        | Document Number |

    Examples:
      | DocumentNumber   | Cellphone     | Names        | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword | NewDocumentNumber    | NewCellphone  | NewNames      | NewFirstSurname       | NewSecondSurname      | NewEmail                      | NewPassword   | NewRepeatPassword |
      | 73000054         | 73000054      | NOMBRELIV    | PRIAPELLIDOLIV      | SEGAPELLIDOLIV       | 73000054test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     | 73000054             | 77000055      | NOMBRELV      | PRIAPELLIDOLV         | SEGAPELLIDOLV         | 77000055test@gmail.com        | Aaaaaaaaa1    | Aaaaaaaaa1        |




#@onlyThis
Scenario Outline: INW-97 - Quick registration with invalid alphabetic and special characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |

    Examples:
      | DocumentNumber   | Cellphone     | Names        | FirstSurname      | SecondSurname      | Email                     | Password   | RepeatPassword |
      | "AAAA*-_."         | 66000322      | NOMCCCXXII   | PRIAPCCCXXII      | SEGAPCCCXXII       | 66000322test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




@onlyThis
Scenario Outline: INW-98 - Quick registration with invalid alphabetic and space characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Space Characters  |

    Examples:
      | DocumentNumber   | Cellphone     | Names        | FirstSurname       | SecondSurname       | Email                     | Password   | RepeatPassword |
      | 6·6323·A·A       | 66000323      | NOMCCCXXIII  | PRIAPCCCXXIII      | SEGAPCCCXXIII       | 66000323test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




@onlyThis
Scenario Outline: INW-99 - Quick registration with invalid alphabetic and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Insufficient Characters  |

    Examples:
      | DocumentNumber   | Cellphone     | Names        | FirstSurname      | SecondSurname      | Email                     | Password   | RepeatPassword |
      | AAA              | 66000324      | NOMCCCXXIV   | PRIAPCCCXXIV      | SEGAPCCCXXIV       | 66000324test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-100 - Quick registration with invalid alphabetic and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Too Many Characters  |

    Examples:
      | DocumentNumber        | Cellphone     | Names       | FirstSurname      | SecondSurname      | Email                     | Password   | RepeatPassword |
      | 66000000000325AA      | 66000325      | NOMCCCXXV   | PRIAPCCCXXV       | SEGAPCCCXXV        | 66000325test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-101 - Quick registration with invalid special characters and space characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Special Characters          |
        | Space Characters                    |

    Examples:
      | DocumentNumber   | Cellphone     | Names        | FirstSurname       | SecondSurname       | Email                     | Password   | RepeatPassword |
      | "#_·*·<·/>"        | 66000326      | NOMCCCXXVI   | PRIAPCCCXXVI       | SEGAPCCCXXVI        | 66000326test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-102 - Quick registration with invalid special characters and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Special Characters          |
        | Insufficient Characters                   |

    Examples:
      | DocumentNumber   | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | "</>"              | 66000327      | NOMCCCXXVII   | PRIAPCCCXXVII       | SEGAPCCCXXVII        | 66000327test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-103 - Quick registration with invalid special characters and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Special Characters          |
        | Too Many Characters                  |

    Examples:
      | DocumentNumber          | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | -----*+_,.$%</>[]     | 66000328      | NOMCCCXXVIII  | PRIAPCCCXXVIII      | SEGAPCCCXXVIII       | 66000328test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-104 - Quick registration with invalid space characters and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Space Characters          |
        | Insufficient Characters   |

    Examples:
      | DocumentNumber   | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | 6·6              | 66000329      | NOMCCCXXIX    | PRIAPCCCXXIX        | SEGAPCCCXXIX         | 66000329test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-105 - Quick registration with invalid space characters and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Space Characters          |
        | Too Many Characters                  |

    Examples:
      | DocumentNumber                       | Cellphone     | Names       | FirstSurname    | SecondSurname    | Email                     | Password   | RepeatPassword |
      | 6·6·0·0·0·0·0·0·0·0·0·3·3·0          | 66000330      | NOMCCCXXX   | PRIAPCCCXXX     | SEGAPCCCXXX      | 66000330test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-106 - Quick registration with invalid alphabetic, special characters and space characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |
        | Space Characters          |

    Examples:
      | DocumentNumber   | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | "<AA·AA·>"         | 66000331      | NOMCCCXXXI    | PRIAPCCCXXXI        | SEGAPCCCXXXI         | 66000331test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-107 - Quick registration with invalid alphabetic, special characters and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |
        | Insufficient Characters   |

    Examples:
      | DocumentNumber   | Cellphone     | Names          | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
      | "<A>"              | 66000332      | NOMCCCXXXII    | PRIAPCCCXXXII        | SEGAPCCCXXXII         | 66000332test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-108 - Quick registration with invalid alphabetic, special characters and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |
        | Too Many Characters   |

    Examples:
      | DocumentNumber               | Cellphone     | Names          | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
      | "<AA66AA00AA00AA00AA333>"      | 66000333      | NOMCCCXXXIII   | PRIAPCCCXXXIII       | SEGAPCCCXXXIII        | 66000333test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-109 - Quick registration with invalid alphabetic, space characters and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Space Characters  |
        | Insufficient Characters   |

    Examples:
      | DocumentNumber   | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | A·A              | 66000334      | NOMCCCXXXIV   | PRIAPCCCXXXIV       | SEGAPCCCXXXIV        | 66000334test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-110 - Quick registration with invalid alphabetic, space characters and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Space Characters  |
        | Too Many Characters   |

    Examples:
      | DocumentNumber             | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | A·A·AA·AA·AAA·AAA          | 66000335      | NOMCCCXXXV    | PRIAPCCCXXXV        | SEGAPCCCXXXV         | 66000335test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-111 - Quick registration with invalid special characters, space characters and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Special Characters          |
        | Space Characters  |
        | Insufficient Characters   |

    Examples:
      | DocumentNumber      | Cellphone     | Names         | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
      | "@·/"               | 66000336      | NOMCCCXXXVI   | PRIAPCCCXXXVI       | SEGAPCCCXXXVI        | 66000336test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-112 - Quick registration with invalid special characters, space characters and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Special Characters          |
        | Space Characters  |
        | Too Many Characters   |

    Examples:
    | DocumentNumber                | Cellphone     | Names          | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
    | "@·/·#·,·*·#·><·:;"             | 66000337      | NOMCCCXXXVII   | PRIAPCCCXXXVII       | SEGAPCCCXXXVII        | 66000337test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-113 - Quick registration with invalid alphabetic, special characters, spaces and insufficient characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |
        | Space Characters            |
        | Insufficient Characters     |

    Examples:
      | DocumentNumber   | Cellphone     | Names          | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
      | "<·A"              | 66000338      | NOMCCCXXXVIII  | PRIAPCCCXXXVIII      | SEGAPCCCXXXVIII       | 66000338test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-114 - Quick registration with invalid alphabetic, special characters, spaces and too many characters in "Document Number"
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
    And The field "Document Number" should contain the following error messages
        | Invalid Alphabetic Characters          |
        | Invalid Special Characters  |
        | Space Characters            |
        | Too Many Characters         |

    Examples:
      | DocumentNumber                  | Cellphone     | Names          | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
      | "@·/·AA·#·,·*·B·#·C·><·:;·DD"   | 66000339      | NOMCCCXXXIX    | PRIAPCCCXXXIX        | SEGAPCCCXXXIX         | 66000339test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |

