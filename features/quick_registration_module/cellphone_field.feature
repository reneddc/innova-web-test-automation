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
    And The following fields should display the "Empty Field" error message
      | Cellphone |

    Examples:
        | DocumentNumber  | Cellphone | Names           | FirstSurname        | SecondSurname           | Email                   | Password    | RepeatPassword  |
        | 66000056        | ""        | NOMBRELVI       | PRIAPELLIDOLVI      | SEGAPELLIDOLVI          | 66000056test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1      |



Scenario Outline: INW-24 - Quick registration with invalid alphabetic and space characters in "Cellphone" field
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
    And The field "Cellphone" should contain the following error messages
        | Invalid Special Characters         |

    Examples:
    | DocumentNumber   | Cellphone     | Names         | FirstSurname         | SecondSurname         | Email                     | Password   | RepeatPassword |
    | 66000057         | 6600057.      | NOMBRELVII     | PRIAPELLIDOLVII       | SEGAPELLIDOLVII        | 66000057test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000058         | 6600058_      | NOMBRELVIII    | PRIAPELLIDOLVIII      | SEGAPELLIDOLVIII       | 66000058test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000059         | 6600059*      | NOMBRELIX      | PRIAPELLIDOLIX        | SEGAPELLIDOLIX         | 66000059test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000060         | 6600060,      | NOMBRELX       | PRIAPELLIDOLX         | SEGAPELLIDOLX          | 66000060test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000061         | 6-------      | NOMBRELXI      | PRIAPELLIDOLXI        | SEGAPELLIDOLXI         | 66000061test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000062         | (66)0062      | NOMBRELXII     | PRIAPELLIDOLXII       | SEGAPELLIDOLXII        | 66000062test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000063         | 6600063$      | NOMBRELXIII    | PRIAPELLIDOLXIII      | SEGAPELLIDOLXIII       | 66000063test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000064         | 6600064#      | NOMBRELXIV     | PRIAPELLIDOLXIV       | SEGAPELLIDOLXIV        | 66000064test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
    | 66000065         | 6😀😀😀😀😀😀😀 | NOMBRELXV      | PRIAPELLIDOLXV        | SEGAPELLIDOLXV         | 66000065test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-25 - Quick registration with space characters in "Cellphone" field
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
    And The field "Cellphone" should contain the following error messages
        | Space Characters         |

    Examples:
      | DocumentNumber | Cellphone          | Names        | FirstSurname      | SecondSurname      | Email                  | Password   | RepeatPassword |
      | 66000066       | 6·······           | NOMBRELXVI   | PRIAPELLIDOLXVI   | SEGAPELLIDOLXVI    | 66000066test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000067       | 66·00·67           | NOMBRELXVII  | PRIAPELLIDOLXVII  | SEGAPELLIDOLXVII   | 66000067test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000068       | 6······8           | NOMBRELXVIII | PRIAPELLIDOLXVIII | SEGAPELLIDOLXVIII  | 66000068test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000069       | 6669····           | NOMBRELXIX   | PRIAPELLIDOLXIX   | SEGAPELLIDOLXIX    | 66000069test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000070       | 66·00·00·70        | NOMBRELXX    | PRIAPELLIDOLXX    | SEGAPELLIDOLXX     | 66000070test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000071       | 6600071·           | NOMBRELXXI   | PRIAPELLIDOLXXI   | SEGAPELLIDOLXXI    | 66000071test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000072       | ·······6           | NOMBRELXXII  | PRIAPELLIDOLXXII  | SEGAPELLIDOLXXII   | 66000072test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000073       | ·6600073           | NOMBRELXXIII | PRIAPELLIDOLXXIII | SEGAPELLIDOLXXIII  | 66000073test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000074       | ········           | NOMBRELXXIV  | PRIAPELLIDOLXXIV  | SEGAPELLIDOLXXIV   | 66000074test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-26 - Quick registration with insufficient characters in "Cellphone" field
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
    And The field "Cellphone" should contain the following error messages
        | Insufficient Characters         |

    Examples:
      | DocumentNumber | Cellphone  | Names       | FirstSurname      | SecondSurname      | Email                  | Password   | RepeatPassword |
      | 66000075       | 6600075    | NOMBRELXXV  | PRIAPELLIDOLXXV   | SEGAPELLIDOLXXV    | 66000075test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-27 - Quick registration with too many characters in "Cellphone" field
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
    And The field "Cellphone" should contain the following error messages
        | Too Many Characters        |

    Examples:
      | DocumentNumber | Cellphone   | Names       | FirstSurname      | SecondSurname      | Email                  | Password   | RepeatPassword |
      | 66000076       | 660000076   | NOMBRELXXVI | PRIAPELLIDOLXXVI  | SEGAPELLIDOLXXVI   | 66000076test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-28 - Quick registration with a "Cellphone" credential that doen't start with 6 or 7
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
    And The field "Cellphone" should contain the following error messages
        | Start with 6 or 7        |

    Examples:
      | DocumentNumber | Cellphone   | Names          | FirstSurname        | SecondSurname      | Email                  | Password   | RepeatPassword |
      | 66000077       | 56000077    | NOMBRELXXVII   | PRIAPELLIDOLXXVII   | SEGAPELLIDOLXXVII   | 66000077test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000078       | 86000078    | NOMBRELXXVIII  | PRIAPELLIDOLXXVIII  | SEGAPELLIDOLXXVIII  | 66000078test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000079       | 06000079    | NOMBRELXXIX    | PRIAPELLIDOLXXIX    | SEGAPELLIDOLXXIX    | 66000079test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
      | 66000080       | 16000080    | NOMBRELXXX     | PRIAPELLIDOLXXX     | SEGAPELLIDOLXXX     | 66000080test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-29 - Quick registration with a "Cellphone" credential that has edge characters
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
      | DocumentNumber | Cellphone   | Names        | FirstSurname       | SecondSurname      | Email                  | Password   | RepeatPassword |
      | 66000081       | 76000081    | NOMBRELXXXI  | PRIAPELLIDOLXXXI   | SEGAPELLIDOLXXXI   | 66000081test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-30 - Quick registration changing invalid "Cellphone" to a valid one
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
      | DocumentNumber      | Cellphone   | Names         | FirstSurname        | SecondSurname       | Email                  | Password   | RepeatPassword | DocumentNumberChanged | CellphoneChanged | NamesChanged | FirstSurnameChanged | SecondSurnameChanged | EmailChanged          | PasswordChanged | RepeatPasswordChanged |
      | 66000082            | 760000082   | NOMBRELXXXII  | PRIAPELLIDOLXXXII  | SEGAPELLIDOLXXXII   | 66000082test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000082              | 76000082          | NOMBRELXXXII  | PRIAPELLIDOLXXXII  | SEGAPELLIDOLXXXII   | 66000082test@gmail.com | Aaaaaaaaa1      | Aaaaaaaaa1     |
      | 66000083            | 6683        | NOMBRELXXXIII | PRIAPELLIDOLXXXIII | SEGAPELLIDOLXXXIII  | 66000083test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000083              | 76000083          | NOMBRELXXXIII | PRIAPELLIDOLXXXIII | SEGAPELLIDOLXXXIII  | 66000083test@gmail.com | Aaaaaaaaa1      | Aaaaaaaaa1     |
      | 66000084            | ""          | NOMBRELXXXIV  | PRIAPELLIDOLXXXIV  | SEGAPELLIDOLXXXIV   | 66000084test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000084              | 76000084          | NOMBRELXXXIV  | PRIAPELLIDOLXXXIV  | SEGAPELLIDOLXXXIV   | 66000084test@gmail.com | Aaaaaaaaa1      | Aaaaaaaaa1     |
      | 66000085            | 46000085    | NOMBRELXXXV   | PRIAPELLIDOLXXXV   | SEGAPELLIDOLXXXV    | 66000085test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000085              | 66000085          | NOMBRELXXXV   | PRIAPELLIDOLXXXV   | SEGAPELLIDOLXXXV    | 66000085test@gmail.com | Aaaaaaaaa1      | Aaaaaaaaa1     |     





 Scenario Outline: INW-31 - Quick registration entering a previously registered "Cellphone" credential
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
        | Cellphone |

    Examples:
      | DocumentNumber    | Cellphone     | Names        | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword | NewDocumentNumber    | NewCellphone  | NewNames      | NewFirstSurname       | NewSecondSurname      | NewEmail                      | NewPassword   | NewRepeatPassword |
      | 66000086          | 66000086      | NOMBRELXXXVI  | PRIAPELLIDOLXXXVI   | SEGAPELLIDOLXXXVI    | 66000086test@gmail.com | Aaaaaaaaa1  | Aaaaaaaaa1     | 66000087               | 66000086    | NOMBRELXXXVII | PRIAPELLIDOLXXXVII  | SEGAPELLIDOLXXXVII   | 66000087test@gmail.com     | Aaaaaaaaa1  | Aaaaaaaaa1     |
    





Scenario Outline: INW-96 - Quick registration with a "Cellphone" credential that contains alphabetic characters
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
    And The field "Cellphone" should contain the following error messages
        | Alphabetic Characters        |

    Examples:
      | DocumentNumber | Cellphone   | Names          | FirstSurname         | SecondSurname         | Email                   | Password    | RepeatPassword |
      | 66000319       | 6600319A    | NOMBRECCCXIX   | PRIAPELLIDOCCCXIX    | SEGAPELLIDOCCCXIX     | 66000319test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
      | 66000320       | A6600320    | NOMBRECCCXX    | PRIAPELLIDOCCCXX     | SEGAPELLIDOCCCXX      | 66000320test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
      | 66000321       | 66AAAAAA    | NOMBRECCCXXI   | PRIAPELLIDOCCCXXI    | SEGAPELLIDOCCCXXI     | 66000321test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-115 - Quick registration with a "Cellphone" credential that contains alphabetic characters and invalid special characters
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
    And The field "Cellphone" should contain the following error messages
      | Alphabetic Characters               |
      | Invalid Special Characters          |

    Examples:
    | DocumentNumber | Cellphone | Names     | FirstSurname | SecondSurname | Email                   | Password    | RepeatPassword |
    | 66000340       | 66AAA.@   | NOMCCCXL  | PRIAPCCCXL   | SEGAPCCCXL    | 66000340test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-116 - Quick registration with a "Cellphone" credential that contains alphabetic characters and space characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |

  Examples:
    | DocumentNumber | Cellphone  | Names      | FirstSurname  | SecondSurname  | Email                   | Password    | RepeatPassword |
    | 66000341       | 66·3·4·1   | NOMCCCXLI  | PRIAPCCCXLI   | SEGAPCCCXLI    | 66000341test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-117 - Quick registration with a "Cellphone" credential that contains alphabetic characters and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000342       | A6600342   | NOMCCCXLII  | PRIAPCCCXLII   | SEGAPCCCXLII    | 66000342test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-118 - Quick registration with a "Cellphone" credential that contains alphabetic characters and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname    | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000343       | 66343AA    | NOMCCCXLIII   | PRIAPCCCXLIII   | SEGAPCCCXLIII     | 66000343test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-119 - Quick registration with a "Cellphone" credential that contains alphabetic characters and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone              | Names         | FirstSurname    | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000344       | 660000000000344AA      | NOMCCCXLIV    | PRIAPCCCXLIV    | SEGAPCCCXLIV      | 66000344test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-120 - Quick registration with a "Cellphone" credential that contains invalid special characters and space characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname    | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000345       | 66·:;··@   | NOMCCCXLV     | PRIAPCCCXLV     | SEGAPCCCXLV       | 66000345test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-121 - Quick registration with a "Cellphone" credential that contains invalid special characters and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname      | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000346       | @6600346   | NOMCCCXLVI    | PRIAPCCCXLVI      | SEGAPCCCXLVI      | 66000346test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-122 - Quick registration with a "Cellphone" credential that contains invalid special characters and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname      | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000347       | 66347@*    | NOMCCCXLVII   | PRIAPCCCXLVII     | SEGAPCCCXLVII     | 66000347test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-123 - Quick registration with a "Cellphone" credential that contains invalid special characters and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone          | Names         | FirstSurname      | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000348       | 66000000348@*      | NOMCCCXLVIII  | PRIAPCCCXLVIII    | SEGAPCCCXLVIII    | 66000348test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-124 - Quick registration with a "Cellphone" credential that contains space characters and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Space Characters                    |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone          | Names         | FirstSurname      | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000349       | ···66349             | NOMCCCXLIX    | PRIAPCCCXLIX      | SEGAPCCCXLIX      | 66000349test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-125 - Quick registration with a "Cellphone" credential that contains space characters and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Space Characters                    |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone          | Names         | FirstSurname      | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000350       | 66··350            | NOMCCCL       | PRIAPCCCL         | SEGAPCCCL         | 66000350test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-126 - Quick registration with a "Cellphone" credential that contains space characters and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Space Characters                    |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000351       | 67··000······000······351 | NOMCCCLI    | PRIAPCCCLI     | SEGAPCCCLI      | 66000351test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-127 - Quick registration with a "Cellphone" credential that contains insufficient characters and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Insufficient Characters             |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000352       | 560352     | NOMCCCLII   | PRIAPCCCLII    | SEGAPCCCLII     | 66000352test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-128 - Quick registration with a "Cellphone" credential that contains too many characters and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Too Many Characters                 |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone                | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000353       | 56000000000353           | NOMCCCLIII  | PRIAPCCCLIII   | SEGAPCCCLIII    | 66000353test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-129 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, and space characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000354       | 6A:·B;·*   | NOMCCCLIV   | PRIAPCCCLIV    | SEGAPCCCLIV     | 66000354test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-130 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000355       | GA*#@<>;   | NOMCCCLV    | PRIAPCCCLV     | SEGAPCCCLV      | 66000355test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-131 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000356       | 66A<>*     | NOMCCCLVI     | PRIAPCCCLVI    | SEGAPCCCLVI      | 66000356test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-132 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                | Names         | FirstSurname   | SecondSurname    | Email                   | Password    | RepeatPassword |
    | 66000357       | 6AA<_#@/-+.;,:.>*$!&%   | NOMCCCLVII   | PRIAPCCCLVII    | SEGAPCCCLVII     | 66000357test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-133 - Quick registration with a "Cellphone" credential that contains alphabetic characters, space characters, and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000358       | AAA·AA··A  | NOMCCCLVIII  | PRIAPCCCLVIII   | SEGAPCCCLVIII    | 66000358test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-134 - Quick registration with a "Cellphone" credential that contains alphabetic characters, space characters, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname    | SecondSurname     | Email                   | Password    | RepeatPassword |
    | 66000359       | 6A···A     | NOMCCCLIX     | PRIAPCCCLIX     | SEGAPCCCLIX       | 66000359test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-135 - Quick registration with a "Cellphone" credential that contains alphabetic characters, space characters, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone            | Names         | FirstSurname    | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000360       | 66AA··00·00·AA··360  | NOMCCCLX      | PRIAPCCCLX      | SEGAPCCCLX       | 66000360test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-136 - Quick registration with a "Cellphone" credential that contains alphabetic characters, doesn't start with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000361       | 56361AA    | NOMCCCLXI   | PRIAPCCCLXI    | SEGAPCCCLXI     | 66000361test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-137 - Quick registration with a "Cellphone" credential that contains alphabetic characters, doesn't start with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                    | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000362       | 56361AAAAAAAAAA              | NOMCCCLXII  | PRIAPCCCLXII   | SEGAPCCCLXII    | 66000362test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-138 - Quick registration with a "Cellphone" credential that contains invalid special characters, space characters, and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000363       | *·6#@·.    | NOMCCCLXIII | PRIAPCCCLXIII  | SEGAPCCCLXIII   | 66000363test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-139 - Quick registration with a "Cellphone" credential that contains invalid special characters, space characters, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000364       | 6·*#·@.    | NOMCCCLXIV  | PRIAPCCCLXIV   | SEGAPCCCLXIV    | 66000364test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-140 - Quick registration with a "Cellphone" credential that contains invalid special characters, space characters, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone        | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000365       | 66·*#·@.·/·$·;:  | NOMCCCLXV   | PRIAPCCCLXV    | SEGAPCCCLXV     | 66000365test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-141 - Quick registration with a "Cellphone" credential that contains invalid special characters, doesn't start with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000366       | *66:3#.    | NOMCCCLXVI   | PRIAPCCCLXVI    | SEGAPCCCLXVI     | 66000366test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-142 - Quick registration with a "Cellphone" credential that contains invalid special characters, doesn't start with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone            | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000367       | *66:3#._,-@       | NOMCCCLXVII  | PRIAPCCCLXVII   | SEGAPCCCLXVII    | 66000367test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-143 - Quick registration with a "Cellphone" credential that contains space characters, doesn't start with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000368       | 5·3·6·8    | NOMCCCLXVIII | PRIAPCCCLXVIII  | SEGAPCCCLXVIII   | 66000368test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-144 - Quick registration with a "Cellphone" credential that contains space characters, doesn't start with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone          | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000369       | 66··00··00·369     | NOMCCCLXIX   | PRIAPCCCLXIX    | SEGAPCCCLXIX     | 66000369test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-145 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, space characters, and doesn't start with 6 or 7
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |

  Examples:
    | DocumentNumber | Cellphone  | Names         | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000370       | 5A·:B·@*   | NOMCCCLXX     | PRIAPCCCLXX     | SEGAPCCCLXX      | 66000370test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-146 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, space characters, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000371       | 6A*·A@     | NOMCCCLXXI   | PRIAPCCCLXXI    | SEGAPCCCLXXI     | 66000371test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-147 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, space characters, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone        | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000372       | 6A*·A@·B#·.;·A_  | NOMCCCLXXII  | PRIAPCCCLXXII   | SEGAPCCCLXXII    | 66000372test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-148 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, a number not starting with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000373       | 5A:B*      | NOMCCCLXXIII | PRIAPCCCLXXIII  | SEGAPCCCLXXIII   | 66000373test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-149 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, a number not starting with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone        | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000374       | 5A:B*C/#@$%      | NOMCCCLXXIV  | PRIAPCCCLXXIV   | SEGAPCCCLXXIV    | 66000374test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-150 - Quick registration with a "Cellphone" credential that contains alphabetic characters, space characters, a number not starting with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000375       | 5·A·A·5    | NOMCCCLXXV   | PRIAPCCCLXXV    | SEGAPCCCLXXV     | 66000375test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-151 - Quick registration with a "Cellphone" credential that contains alphabetic characters, space characters, a number not starting with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                | Names         | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000376       | 5·A·A·A·A·A·A·A·A·A·A·6  | NOMCCCLXXVI   | PRIAPCCCLXXVI   | SEGAPCCCLXXVI    | 66000376test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |





Scenario Outline: INW-152 - Quick registration with a "Cellphone" credential that contains invalid special characters, space characters, a number not starting with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000377       | 5·*·$·7    | NOMCCCLXXVII | PRIAPCCCLXXVII  | SEGAPCCCLXXVII   | 66000377test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-153 - Quick registration with a "Cellphone" credential that contains invalid special characters, space characters, a number not starting with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000378       | 5·*·$·_·:·;·,·#·%·>·<7   | NOMCCCLXXVIII| PRIAPCCCLXXVIII | SEGAPCCCLXXVIII  | 66000378test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |






Scenario Outline: INW-154 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, space characters, a number not starting with 6 or 7, and insufficient characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Insufficient Characters             |

  Examples:
    | DocumentNumber | Cellphone  | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000379       | 5·A·*/     | NOMCCCLXXIX  | PRIAPCCCLXXIX   | SEGAPCCCLXXIX    | 66000379test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-155 - Quick registration with a "Cellphone" credential that contains alphabetic characters, invalid special characters, space characters, a number not starting with 6 or 7, and too many characters
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
  And The field "Cellphone" should contain the following error messages
    | Alphabetic Characters               |
    | Invalid Special Characters          |
    | Space Characters                    |
    | Start with 6 or 7                   |
    | Too Many Characters                 |

  Examples:
    | DocumentNumber | Cellphone                | Names       | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
    | 66000380       | 6·A·*/···AA·-#··%$·5     | NOMCCCLXXX   | PRIAPCCCLXXX    | SEGAPCCCLXXX     | 66000380test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




























