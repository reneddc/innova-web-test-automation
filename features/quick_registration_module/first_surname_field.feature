Feature: Validate the Quick registration focused on "First Surname" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page

  
@smokeTest
  Scenario Outline: INW-43 - Quick Registration attempt with missing "First Surname" field
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
      | First Surname |

    Examples:
        | DocumentNumber | Cellphone | Names         | FirstSurname     | SecondSurname       | Email                  | Password    | RepeatPassword |
        | 66000123       | 66000123  | NOMBRECXXIII  | ""               | SEGAPELLIDOCXXIII   | 66000123test@gmail.com | Aaaaaaaaa1  | Aaaaaaaaa1     |



  Scenario Outline: INW-44 - Quick registration with a "First Surname" field that contains numeric characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters             |

    Examples:
        | DocumentNumber | Cellphone | Names         | FirstSurname     | SecondSurname        | Email                   | Password    | RepeatPassword |
        | 66000124       | 66000124  | NOMBRECXXIV   | PRIAPELLIDO124   | SEGAPELLIDOCXXIV     | 66000124test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000125       | 66000125  | NOMBRECXXV    | 124PRIAPELLIDO   | SEGAPELLIDOCXXV      | 66000125test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000126       | 66000126  | NOMBRECXXVI   | PR1APELLIDO      | SEGAPELLIDOCXXVI     | 66000126test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000127       | 66000127  | NOMBRECXXVII  | PRIAPELLIDO½     | SEGAPELLIDOCXXVII    | 66000127test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |




Scenario Outline: INW-45 - Quick registration with a "First Surname" credential that has valid special characters
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
        | DocumentNumber | Cellphone | Names         | FirstSurname  | SecondSurname      | Email                    | Password    | RepeatPassword |
        | 66000128       | 66000128  | NOMBRECXXVIII | ÁÉÍÓÚ         | SEGAPELLIDOCXXVIII | 66000128test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000129       | 66000129  | NOMBRECXXIX   | ÑÑÑÑÑ         | SEGAPELLIDOCXXIX   | 66000129test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000130       | 66000130  | NOMBRECXXX    | ÄËÏÖÜ         | SEGAPELLIDOCXXX    | 66000130test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000131       | 66000131  | NOMBRECXXXI   | ÇÇÇÇÇ         | SEGAPELLIDOCXXXI   | 66000131test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-046 - Quick registration with a "First Surname" field that contains invalid special characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters   |

    Examples:
        | DocumentNumber | Cellphone | Names           | FirstSurname        | SecondSurname       | Email                   | Password    | RepeatPassword |
        | 66000132       | 66000132  | NOMBRECXXXII    | PRI_APELLIDO        | SEGAPELLIDOCXXXII    | 66000132test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000133       | 66000133  | NOMBRECXXXIII   | PRI.APELLIDO        | SEGAPELLIDOCXXXIII   | 66000133test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000134       | 66000134  | NOMBRECXXXIV    | PRO-APELLIDO        | SEGAPELLIDOCXXXIV    | 66000134test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000135       | 66000135  | NOMBRECXXXV     | PRI@APELLIDO        | SEGAPELLIDOCXXXV     | 66000135test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000136       | 66000136  | NOMBRECXXXVI    | PRI*APELLIDO        | SEGAPELLIDOCXXXVI    | 66000136test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000137       | 66000137  | NOMBRECXXXVII   | 😀😀😀😀😀        | SEGAPELLIDOCXXXVII   | 66000137test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000138       | 66000138  | NOMBRECXXXVIII  | PRIAPELLIDO:        | SEGAPELLIDOCXXXVIII  | 66000138test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000139       | 66000139  | NOMBRECXXXIX    | <PRIAPELLIDO/>      | SEGAPELLIDOCXXXIX    | 66000139test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000140       | 66000140  | NOMBRECXL       | (PRIAPELLIDO)       | SEGAPELLIDOCXL       | 66000140test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |
        | 66000141       | 66000141  | NOMBRECXLI      | "`${PRIAPELLIDO}`"    | SEGAPELLIDOCXLI      | 66000141test@gmail.com   | Aaaaaaaaa1  | Aaaaaaaaa1     |




  Scenario Outline: INW-47 - Quick registration with a "First Surname" credential that has valid space characters
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
        | DocumentNumber | Cellphone | Names        | FirstSurname              | SecondSurname        | Email                  | Password   | RepeatPassword   |
        | 66000142       | 66000142  | NOMBRECXLII  | PRI·APELLIDO·PRI·APELLIDO | SEGAPELLIDOCXLII     | 66000142test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1       |




  Scenario Outline: INW-048 - Quick registration with a "First Surname" field that contains invalid space characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone | Names        | FirstSurname     | SecondSurname        | Email                  | Password   | RepeatPassword |
        | 66000143       | 66000143  | NOMBRECXLIII | PRI··APELLIDO    | SEGAPELLIDOCXLIII    | 66000143test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000144       | 66000144  | NOMBRECXLIV  | ········         | SEGAPELLIDOCXLIV     | 66000144test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000145       | 66000145  | NOMBRECXLV   | ···P             | SEGAPELLIDOCXLV      | 66000145test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000146       | 66000146  | NOMBRECXLVI  | P···             | SEGAPELLIDOCXLVI     | 66000146test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000147       | 66000147  | NOMBRECXLVII | P··R             | SEGAPELLIDOCXLVII    | 66000147test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-049 - Quick registration with a "First Surname" field that contains an insufficient number of characters
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
    And The field "First Surname" should contain the following error messages
        | Insufficient Characters   |

    Examples:
        | DocumentNumber | Cellphone | Names              | FirstSurname       | SecondSurname          | Email                 | Password   | RepeatPassword |
        | 66000148       | 66000148  | NOMBRECXLVIII·P    | SEGAPELLIDOCXLVIII | 66000148test@gmail.com | Aaaaaaaaa1            | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-050 - Quick registration with a "First Surname" field that contains too many characters
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
    And The field "First Surname" should contain the following error messages
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname                                            | SecondSurname        | Email                  | Password   | RepeatPassword |
        | 66000149       | 66000149    | NOMBRECXLIX   | PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP    | SEGAPELLIDOCXLIX     | 66000149test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




  Scenario Outline: INW-51 - Quick registration with a "First Surname" credential that has edge characters
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
        | DocumentNumber | Cellphone   | Names        | FirstSurname                                           | SecondSurname       | Email                  | Password   | RepeatPassword |
        | 66000150       | 66000150    | NOMBRECL     | PR                                                     | SEGAPELLIDOCL       | 66000150test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000151       | 66000151    | NOMBRECLI    | PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP    | SEGAPELLIDOCLI      | 66000151test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-52 - Quick registration changing invalid "First Surname" to a valid one
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
        | DocumentNumber | Cellphone   | Names       | FirstSurname        | SecondSurname       | Email                  | Password   | RepeatPassword | DocumentNumberChanged     | CellphoneChanged  | NamesChanged  | FirstSurnameChanged   | SecondSurnameChanged  | EmailChanged           | PasswordChanged      | RepeatPasswordChanged |
        | 66000152       | 66000152    | NOMBRECLII  | P                   | SEGAPELLIDOCLII     | 66000152test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |66000152                   | 66000152          | NOMBRECLII    | PRIAPELLIDOCLII       | SEGAPELLIDOCLII       | 66000152test@gmail.com | Aaaaaaaaa1           | Aaaaaaaaa1            |
        | 66000153       | 66000153    | NOMBRECLIII | PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP | SEGAPELLIDOCLIII    | 66000153test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |66000153       | 66000153    | NOMBRECLIII | PRIAPELLIDOCLIII                                                                                                          | SEGAPELLIDOCLIII    | 66000153test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000154       | 66000154    | NOMBRECLIV  |                     | SEGAPELLIDOCLIV     | 66000154test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |66000154                   | 66000154          | NOMBRECLIV    | PRIAPELLIDOCLIV       | SEGAPELLIDOCLIV       | 66000154test@gmail.com | Aaaaaaaaa1           | Aaaaaaaaa1            |
        | 66000155       | 66000155    | NOMBRECLV   | PRIAPELLIDO155      | SEGAPELLIDOCLV      | 66000155test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |66000155                   | 66000155          | NOMBRECLV     | PRIAPELLIDOCLV        | SEGAPELLIDOCLV        | 66000155test@gmail.com | Aaaaaaaaa1           | Aaaaaaaaa1            |




 Scenario Outline: INW-53 - Quick registration entering a previously registered "First Surname" credential
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
        | DocumentNumber    | Cellphone   | Names           | FirstSurname      | SecondSurname         | Email                     | Password      | RepeatPassword | NewDocumentNumber    | NewCellphone  | NewNames      | NewFirstSurname       | NewSecondSurname      | NewEmail                  | NewPassword     | NewRepeatPassword   |
        | 66000156          | 66000156    | NOMBRECLVI      | PRIAPELLIDOCLVI   | SEGAPELLIDOCLVI       | 66000156test@gmail.com    | Aaaaaaaaa1    | Aaaaaaaaa1     |66000157              | 66000157      | NOMBRECLVII   | PRIAPELLIDOCLVI       | SEGAPELLIDOCLVII      | 66000157test@gmail.com    | Aaaaaaaaa1      | Aaaaaaaaa1          |




Scenario Outline: INW-170 - Quick registration with a "First Surname" field that contains numeric characters and invalid special characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname   | SecondSurname    | Email                  | Password   | RepeatPassword |
        | 66000395       | 66000395    | NOMCCCXCV     | PRIAP#395      | SEGAPCCCXCV      | 66000395test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-171 - Quick registration with a "First Surname" field that contains numeric characters and space characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname   | SecondSurname    | Email                  | Password   | RepeatPassword |
        | 66000396       | 66000396    | NOMCCCXCVI    | PRIAP···396    | SEGAPCCCXCVI     | 66000396test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-172 - Quick registration with a "First Surname" field that contains numeric characters and insufficient characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Insufficient Characters    |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname   | SecondSurname    | Email                  | Password   | RepeatPassword |
        | 66000397       | 66000397    | NOMCCCXCVII   | 3              | SEGAPCCCXCVII    | 66000397test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-173 - Quick registration with a "First Surname" field that contains numeric characters and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters       |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname                                                                                                           | SecondSurname    | Email                  | Password   | RepeatPassword |
        | 66000398       | 66000398    | NOMCCCXCVIII  | PRIAP398398398398398398398398398398398398398398398398398398398398398398398398398398398398398398398398398             | SEGAPCCCXCVIII   | 66000398test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-174 - Quick registration with a "First Surname" field that contains special characters and space characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters  |
        | Invalid Space Characters    |

    Examples:
        | DocumentNumber | Cellphone   | Names        | FirstSurname    | SecondSurname   | Email                  | Password   | RepeatPassword |
        | 66000399       | 66000399    | NOMCCCXCIX   | PRIAP···#=@     | SEGAPCCCXCIX    | 66000399test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-175 - Quick registration with a "First Surname" field that contains special characters and insufficient characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters |
        | Insufficient Characters    |

    Examples:
        | DocumentNumber | Cellphone   | Names  | FirstSurname | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000400       | 66000400    | NOMCD  | @            | SEGAPCD       | 66000400test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-176 - Quick registration with a "First Surname" field that contains special characters and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names   | FirstSurname                                      | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000401       | 66000401    | NOMCDI  | "PRIAP@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;@##<>@*-=%$?.,:;" | SEGAPCDI | 66000401test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |



@onlyThis
Scenario Outline: INW-177 - Quick registration with a "First Surname" field that contains spaces and insufficient characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone   | Names   | FirstSurname | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000402       | 66000402    | NOMCDII | ·            | SEGAPCDII     | 66000402test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |





Scenario Outline: INW-178 - Quick registration with a "First Surname" field that contains spaces and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname                                                                                                | SecondSurname  | Email                  | Password   | RepeatPassword |
        | 66000403       | 66000403    | NOMCDIII | PRIAP·················C············D············CI············I········································I    | SEGAPCDIII     | 66000403test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-179 - Quick registration with a "First Surname" field that contains numbers, special characters, and spaces
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Invalid Space Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname                            | SecondSurname  | Email                  | Password   | RepeatPassword |
        | 66000404       | 66000404    | NOMCDIV  | PRIAP404····*</>                         | SEGAPCDIV      | 66000404test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-180 - Quick registration with a "First Surname" field that contains numbers, special characters, and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names   | FirstSurname                                                                                                             | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000405       | 66000405    | NOMCDV  | PRIAP405*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</>*</> | SEGAPCDV      | 66000405test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-181 - Quick registration with a "First Surname" field that contains numbers, spaces, and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters       |
        | Invalid Space Characters |
        | Too Many Characters      |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname                                                                                                                               | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000406       | 66000406    | NOMCDVI  | PRIAP406··········406··········406··········406··········406··········406··········406··········406··········406··········406··········406 | SEGAPCDVI     | 66000406test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |



    Scenario Outline: INW-182 - Quick registration with a "First Surname" field that contains special characters, spaces, and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters |
        | Invalid Space Characters   |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names     | FirstSurname                                                                                                                                                           | SecondSurname     | Email                  | Password   | RepeatPassword |
        | 66000407       | 66000407    | NOMCDVII  | PRIAP·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]·········*/#$%[]  | SEGAPCDVII        | 66000407test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




    Scenario Outline: INW-183 - Quick registration with a "First Surname" field that contains numbers, special characters, spaces, and excessive characters
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
    And The field "First Surname" should contain the following error messages
        | Numeric Characters         |
        | Invalid Special Characters |
        | Invalid Space Characters   |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names      | FirstSurname                                                                                                              | SecondSurname  | Email                  | Password   | RepeatPassword |
        | 66000408       | 66000408    | NOMCDVIII  | PRIAP408·····*#<>408·····*#<>408··········*#<>408·····*#<>408·····*#<>408·····*#<>408·····*#<>408·····*#<>408·····*#<>408 | SEGAPCDVIII    | 66000408test@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1     |




