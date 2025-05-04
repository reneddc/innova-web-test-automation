Feature: Validate the Quick registration focused on "Names" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page

  

  Scenario Outline: INW-32 - Quick Registration attempt with missing "Names" field
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
      | Names |

    Examples:
    | DocumentNumber | Cellphone   | Names     | FirstSurname           | SecondSurname         | Email                   | Password    | RepeatPassword |
    | 66000088       | 66000088    | ""        | PRIAPELLIDOLXXXVIII    | SEGAPELLIDOLXXXVIII   | 66000088test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-33 - Quick registration with a "Names" field that contains numeric characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters             |

    Examples:
        | DocumentNumber | Cellphone   | Names          | FirstSurname      | SecondSurname        | Email                   | Password    | RepeatPassword |  
        | 66000089       | 66000089    | NOMBRE89      | PRIAPELLIDOLXXXIX  | SEGAPELLIDOLXXXIX    | 66000089test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000090       | 66000090    | 90NOMBRE      | PRIAPELLIDOXC      | SEGAPELLIDOXC        | 66000090test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000091       | 66000091    | N0MBREXCI     | PRIAPELLIDOXCI     | SEGAPELLIDOXCI       | 66000091test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000092       | 66000092    | NOMBRE½XCII   | PRIAPELLIDOXCII    | SEGAPELLIDOXCII      | 66000092test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



  Scenario Outline: INW-34 - Quick registration with a "Cellphone" credential that has valid special characters
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
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname        | Email                   | Password    | RepeatPassword |  
        | 66000093       | 66000093    | ÁÉÍÓÚ         | PRIAPELLIDOXCIII   | SEGAPELLIDOXCIII     | 66000093test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000094       | 66000094    | ÑÑÑÑÑ         | PRIAPELLIDOXCIV    | SEGAPELLIDOXCIV      | 66000094test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000095       | 66000095    | ÄËÏÖÜ         | PRIAPELLIDOXCV     | SEGAPELLIDOXCV       | 66000095test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000096       | 66000096    | ÇÇÇÇÇ         | PRIAPELLIDOXCVI    | SEGAPELLIDOXCVI      | 66000096test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |


  Scenario Outline: INW-035 - Quick registration with a "Names" field that contains invalid special characters
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
    And The field "Names" should contain the following error messages
        | Invalid Special Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names          | FirstSurname      | SecondSurname         | Email                  | Password   | RepeatPassword |
        | 66000097       | 66000097    | NOM_BRE       | PRIAPELLIDOXCVII   | SEGAPELLIDOXCVII     | 66000097test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000098       | 66000098    | NOM.BRE       | PRIAPELLIDOXCVIII  | SEGAPELLIDOXCVIII    | 66000098test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000099       | 66000099    | NOM-BRE       | PRIAPELLIDOXCIX    | SEGAPELLIDOXCIX      | 66000099test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000100       | 66000100    | NOM@BRE       | PRIAPELLIDOC       | SEGAPELLIDOC         | 66000100test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000101       | 66000101    | NOM*BRE       | PRIAPELLIDOCI      | SEGAPELLIDOCI        | 66000101test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000102       | 66000102    | 😀😀😀😀😀  | PRIAPELLIDOCII     | SEGAPELLIDOCII       | 66000102test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000103       | 66000103    | NOMBRE:       | PRIAPELLIDOCIII    | SEGAPELLIDOCIII      | 66000103test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000104       | 66000104    | <NOMBRE/>     | PRIAPELLIDOCIV     | SEGAPELLIDOCIV       | 66000104test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000105       | 66000105    | (NOMBRE)      | PRIAPELLIDOCV      | SEGAPELLIDOCV        | 66000105test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000106       | 66000106    | "`${NOMBRE}`" | PRIAPELLIDOCVI     | SEGAPELLIDOCVI       | 66000106test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-36 - Quick registration with a "Cellphone" credential that has valid space characters
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
        | DocumentNumber | Cellphone   | Names                             | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000107       | 66000107    | NOMBRE·NOMBRE·NOMBRE·NOMBRE       | PRIAPELLIDOCVII   | SEGAPELLIDOCVII     | 66000107test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-037 - Quick registration with a "Names" field that contains invalid space characters
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
    And The field "Names" should contain the following error messages
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names           | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000108       | 66000108    | NOMBRE··NOMBRE  | PRIAPELLIDOCVIII  | SEGAPELLIDOCVIII    | 66000108test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000109       | 66000109    | ········        | PRIAPELLIDOCIX    | SEGAPELLIDOCIX      | 66000109test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000110       | 66000110    | ···N            | PRIAPELLIDOCX     | SEGAPELLIDOCX       | 66000110test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000111       | 66000111    | N····           | PRIAPELLIDOCXI    | SEGAPELLIDOCXI      | 66000111test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000112       | 66000112    | N··N            | PRIAPELLIDOCXII   | SEGAPELLIDOCXII     | 66000112test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-038 - Quick registration with a "Names" field that contains an insufficient number of characters
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
    And The field "Names" should contain the following error messages
        | Insufficient Characters   |

    Examples:
    | DocumentNumber | Cellphone    | Names | FirstSurname      | SecondSurname         | Email                     | Password      | RepeatPassword |
    | 66000113       | 66000113     | N     | PRIAPELLIDOCXIII  | SEGAPELLIDOCXIII      | 66000113test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-039 - Quick registration with a "Names" field that contains too many characters
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
    And The field "Names" should contain the following error messages
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names                                                  | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000114       | 66000114    | NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN    | PRIAPELLIDOCXIV   | SEGAPELLIDOCXIV     | 66000114test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-40 - Quick registration with a "Cellphone" credential that has edge characters
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
        | DocumentNumber | Cellphone   | Names                                              | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000115       | 66000115    | NO                                                 | PRIAPELLIDOCXV    | SEGAPELLIDOCXV      | 66000115test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000116       | 66000116    | NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN          | PRIAPELLIDOCXVI   | SEGAPELLIDOCXVI     | 66000116test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-41 - Quick registration changing invalid "Name" to a valid one
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
        | DocumentNumber | Cellphone   | Names            | FirstSurname        | SecondSurname       | Email                   | Password      | RepeatPassword | DocumentNumberChanged    | CellphoneChanged  | NamesChanged      | FirstSurnameChanged   | SecondSurnameChanged  | EmailChanged              | PasswordChanged   | RepeatPasswordChanged |
        | 66000117       | 66000117    | N                | PRIAPELLIDOCXVII    | SEGAPELLIDOCXVII    | 66000117test@gmail.com  | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000117                 | 66000117          | NOMBRECXVII       | PRIAPELLIDOCXVII      | SEGAPELLIDOCXVII      | 66000117test@gmail.com    | Aaaaaaaaa1        | Aaaaaaaaa1            |
        | 66000118       | 66000118    | NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN | PRIAPELLIDOCXVIII | SEGAPELLIDOCXVIII   | 66000118test@gmail.com  | Aaaaaaaaa1   | Aaaaaaaaa1  | 66000118 | 66000118 | PRIAPELLIDOCXVIII | PRIAPELLIDOCXVIII | SEGAPELLIDOCXVIII   | 66000118test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1  |
        | 66000119       | 66000119    | ""               | PRIAPELLIDOCXIX     | SEGAPELLIDOCXIX     | 66000119test@gmail.com  | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000119                 | 66000119          | PRIAPELLIDOCXIX   | PRIAPELLIDOCXIX       | SEGAPELLIDOCXIX       | 66000119test@gmail.com    | Aaaaaaaaa1        | Aaaaaaaaa1            |
        | 66000120       | 66000120    | NOMBRE120        | PRIAPELLIDOCXX      | SEGAPELLIDOCXX      | 66000120test@gmail.com  | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000120                 | 66000120          | NOMBRECXX         | PRIAPELLIDOCXX        | SEGAPELLIDOCXX        | 66000120test@gmail.com    | Aaaaaaaaa1        | Aaaaaaaaa1            |




 Scenario Outline: INW-42 - Quick registration entering a previously registered "Cellphone" credential
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
    Then The information card should be displayed
    And I should be successfully registered in the INNOVA system
    And I accept the successful registration message
    And I should be redirected to the 'Log In' page

    Examples:
        | DocumentNumber | Cellphone   | Names     | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000121       | 66000121    | NOMBRECXXI| PRIAPELLIDOCXXI   | SEGAPELLIDOCXXI     | 66000121test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000122       | 66000122    | NOMBRECXXI| PRIAPELLIDOCXXII  | SEGAPELLIDOCXXII    | 66000122test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-156 - Quick registration with a "Names" field that contains numeric characters and invalid special characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |

    Examples:
        | DocumentNumber | Cellphone    | Names     | FirstSurname      | SecondSurname         | Email                     | Password      | RepeatPassword |
        | 66000381       | 66000381     | NOM#381   | PRIAPCCCLXXXI     | SEGAPCCCLXXXI         | 66000381test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-157 - Quick registration with a "Names" field that contains numeric characters and space characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone | Names     | FirstSurname     | SecondSurname     | Email                     | Password      | RepeatPassword |
        | 66000382       | 66000382  | NOM···382 | PRIAPCCCLXXXII   | SEGAPCCCLXXXII    | 66000382test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-158 - Quick registration with a "Names" field that contains numeric characters and insufficient characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Insufficient Characters    |

    Examples:
        | DocumentNumber    | Cellphone     | Names | FirstSurname      | SecondSurname         | Email                     | Password      | RepeatPassword |
        | 66000383          | 66000383      | 3     | PRIAPCCCLXXXIII   | SEGAPCCCLXXXIII       | 66000383test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-159 - Quick registration with a "Names" field that contains numeric characters and excessive characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters       |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone    | Names                                                                                                                             | FirstSurname      | SecondSurname         | Email                     | Password      | RepeatPassword |
        | 66000384       | 66000384     | NOM384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384384 | PRIAPCCCLXXXIV    | SEGAPCCCLXXXIV        | 66000384test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-160 - Quick registration with a "Names" field that contains special characters and space characters
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
    And The field "Names" should contain the following error messages
        | Invalid Special Characters  |
        | Invalid Space Characters    |

    Examples:
        | DocumentNumber | Cellphone    | Names     | FirstSurname      | SecondSurname | Email                     | Password      | RepeatPassword |
        | 66000385       | 66000385     | NOM···#=@ | PRIAPCCCLXXXV     | SEGAPCCCLXXXV | 66000385test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |




Scenario Outline: INW-161 - Quick registration with a "Names" field that contains special characters and insufficient characters
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
    And The field "Names" should contain the following error messages
        | Invalid Special Characters |
        | Insufficient Characters    |

    Examples:
        | DocumentNumber | Cellphone   | Names  | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000386       | 66000386    | @      | PRIAPCCCLXXXVI    | SEGAPCCCLXXXVI      | 66000386test@gmail.com  | Aaaaaaaaa1  | Aaaaaaaaa1     |



Scenario Outline: INW-162 - Quick registration with a "Names" field that contains special characters and excessive characters
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
    And The field "Names" should contain the following error messages
        | Invalid Special Characters |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names  | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000387       | 66000387    | NOM@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:; | PRIAPCCCLXXXVII | SEGAPCCCLXXXVII | 66000387test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1 |



@onlyThis
Scenario Outline: INW-163 - Quick registration with a "Names" field that contains spaces and excessive characters
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
    And The field "Names" should contain the following error messages
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone   | Names                                  | FirstSurname      | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000388       | 66000388    | ······························         | PRIAPCCCLXXXVIII | SEGAPCCCLXXXVIII | 66000388test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1 |





Scenario Outline: INW-164 - Quick registration with a "Names" field that contains only spaces and excessive characters
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
    And The field "Names" should contain the following error messages
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber    | Cellphone | Names                                                                                                 | FirstSurname      | SecondSurname     | Email                     | Password      | RepeatPassword    |
        | 66000389          | 66000389  | NOM·················C············C············C············LX·······································X | PRIAPCCCLXXXIX    | SEGAPCCCLXXXIX    | 66000389test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1        |





Scenario Outline: INW-165 - Quick registration with a "Names" field that contains numbers, special characters, and spaces
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone | Names            | FirstSurname  | SecondSurname  | Email                    | Password    | RepeatPassword |
        | 66000390       | 66000390  | NOM390······*</> | PRIAPCCCXC    | SEGAPCCCXC     | 66000390test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-166 - Quick registration with a "Names" field that contains numbers, special characters, and excessive characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone | Names                                                                                                                    | FirstSurname      | SecondSurname     | Email                  | Password    | RepeatPassword |
        | 66000391       | 66000391  | NOM391*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>   | PRIAPCCCXCI       | SEGAPCCCXCI       | 66000391test@gmail.com | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-167 - Quick registration with a "Names" field that contains numbers, spaces, and excessive characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters       |
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone | Names                                                                                                                                    | FirstSurname   | SecondSurname   | Email                   | Password    | RepeatPassword |
        | 66000392       | 66000392  | NOM392··········392··········392··········392··········392··········392··········392··········392··········392··········392··········392 | PRIAPCCCXCII   | SEGAPCCCXCII    | 66000392test@gmail.com | Aaaaaaaaa1  | Aaaaaaaaa1     |



    Scenario Outline: INW-168 - Quick registration with a "Names" field that contains special characters, spaces, and excessive characters
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
    And The field "Names" should contain the following error messages
        | Invalid Special Characters |
        | Invalid Space Characters   |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone | Names                                                                                                                                                     | FirstSurname    | SecondSurname    | Email                  | Password    | RepeatPassword |
        | 66000393       | 66000393  | NOM········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[]········*/#$%[] | PRIAPCCCXCIII   | SEGAPCCCXCIII    | 66000393test@gmail.com | Aaaaaaaaa1  | Aaaaaaaaa1     |




    Scenario Outline: INW-169 - Quick registration with a "Names" field that contains numbers, special characters, spaces, and excessive characters
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
    And The field "Names" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Invalid Space Characters   |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone | Names                                                                                                                            | FirstSurname   | SecondSurname   | Email                   | Password   | RepeatPassword |
        | 66000394       | 66000394  | "NOM394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394·····*#<>394" | PRIAPCCCXCIV   | SEGAPCCCXCIV   | 66000394test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |


