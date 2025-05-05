Feature: Validate the Quick registration focused on "Password" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page

  

  Scenario Outline: INW-81 - Quick Registration attempt with missing "Password" field
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
      | Password |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                         | Password    | RepeatPassword |
        | 66000259       | 66000259    | NOMBRECCLIX   | PRIAPELLIDOCCLIX   | SEGAPELLIDOCCLIX    | 66000259test@gmail.com        | ""          | Aaaaaaaaa1     |



Scenario Outline: INW-82 - Quick registration with a "Password" that only contains upper lettters
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
    And The field "Password" should contain the following error messages
        | Invalid Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                         | Password   | RepeatPassword |
        | 66000260       | 66000260    | NOMBRECCLX    | PRIAPELLIDOCCLX    | SEGAPELLIDOCCLX     | 66000260test@gmail.com        | AAAAAAAA   | AAAAAAAA       |



Scenario Outline: INW-83 - Quick registration with a "Password" that only contains lower lettters
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
    And The field "Password" should contain the following error messages
        | Invalid Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                         | Password   | RepeatPassword |
        | 66000261       | 66000261    | NOMBRECCLXI   | PRIAPELLIDOCCLXI   | SEGAPELLIDOCCLXI    | 66000261test@gmail.com        | aaaaaaaa   | aaaaaaaa       |



Scenario Outline: INW-83 - Quick registration with a "Password" that only contains numbers
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
    And The field "Password" should contain the following error messages
        | Invalid Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                         | Password   | RepeatPassword |
        | 66000262       | 66000262    | NOMBRECCLXII  | PRIAPELLIDOCCLXII  | SEGAPELLIDOCCLXII   | 66000262test@gmail.com        | 12345678   | 12345678       |




  Scenario Outline: INW-85 - Quick registration with a "Password" that contains special characters
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
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                         | Password        | RepeatPassword |
        | 66000263       | 66000263    | NOMBRECCLXIII | PRIAPELLIDOCCLXIII | SEGAPELLIDOCCLXIII  | 66000263test@gmail.com        | Aaaaaa1.        | Aaaaaa1.       |
        | 66000264       | 66000264    | NOMBRECCLXIV  | PRIAPELLIDOCCLXIV  | SEGAPELLIDOCCLXIV   | 66000264test@gmail.com        | Aaaaaa1-        | Aaaaaa1-       |
        | 66000265       | 66000265    | NOMBRECCLXV   | PRIAPELLIDOCCLXV   | SEGAPELLIDOCCLXV    | 66000265test@gmail.com        | Aaaaaa1*        | Aaaaaa1*       |
        | 66000266       | 66000266    | NOMBRECCLXVI  | PRIAPELLIDOCCLXVI  | SEGAPELLIDOCCLXVI   | 66000266test@gmail.com        | Aaaaaa1/        | Aaaaaa1/       |
        | 66000267       | 66000267    | NOMBRECCLXVII | PRIAPELLIDOCCLXVII | SEGAPELLIDOCCLXVII  | 66000267test@gmail.com        | Aaaaaa1_        | Aaaaaa1_       |
        | 66000268       | 66000268    | NOMBRECCLXVIII| PRIAPELLIDOCCLXVIII| SEGAPELLIDOCCLXVIII | 66000268test@gmail.com        | …..Aa1          | …..Aa1         |
        | 66000269       | 66000269    | NOMBRECCLXIX  | PRIAPELLIDOCCLXIX  | SEGAPELLIDOCCLXIX   | 66000269test@gmail.com        | A...a..1        | A...a..1       |
        | 66000270       | 66000270    | NOMBRECCLXX   | PRIAPELLIDOCCLXX   | SEGAPELLIDOCCLXX    | 66000270test@gmail.com        | .-_*/+:;,Aa1    | .-_*/+:;,Aa1   |
        | 66000271       | 66000271    | NOMBRECCLXXI  | PRIAPELLIDOCCLXXI  | SEGAPELLIDOCCLXXI   | 66000271test@gmail.com        | &$'"!?·#><Aa1   | &$'"!?·#><Aa1  |



  Scenario Outline: INW-86 - Quick registration with a "Password" that contains special alphabetic characters
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
        | DocumentNumber | Cellphone   | Names            | FirstSurname          | SecondSurname          | Email                         | Password     | RepeatPassword |
        | 66000272       | 66000272    | NOMBRECCLXXII    | PRIAPELLIDOCCLXXII    | SEGAPELLIDOCCLXXII     | 66000272test@gmail.com        | ÁÉÍÓÚAa1     | ÁÉÍÓÚAa1        |
        | 66000273       | 66000273    | NOMBRECCLXXIII   | PRIAPELLIDOCCLXXIII   | SEGAPELLIDOCCLXXIII    | 66000273test@gmail.com        | áéíúóAa1     | áéíúóAa1        |
        | 66000274       | 66000274    | NOMBRECCLXXIV    | PRIAPELLIDOCCLXXIV    | SEGAPELLIDOCCLXXIV     | 66000274test@gmail.com        | Ñññññññ1     | Ñññññññ1        |
        | 66000275       | 66000275    | NOMBRECCLXXV     | PRIAPELLIDOCCLXXV     | SEGAPELLIDOCCLXXV      | 66000275test@gmail.com        | Üüüüüüü1     | Üüüüüüü1        |
        | 66000276       | 66000276    | NOMBRECCLXXVI    | PRIAPELLIDOCCLXXVI    | SEGAPELLIDOCCLXXVI     | 66000276test@gmail.com        | Áaaaaaa1     | Áaaaaaa1        |
        | 66000277       | 66000277    | NOMBRECCLXXVII   | PRIAPELLIDOCCLXXVII   | SEGAPELLIDOCCLXXVII    | 66000277test@gmail.com        | Aáááááá1     | Aáááááá1        |





Scenario Outline: INW-87 - Quick registration with a "Password" that contains space characters
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
    And The field "Password" should contain the following error messages
        | Space Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names              | FirstSurname            | SecondSurname            | Email                         | Password       | RepeatPassword  |
        | 66000278       | 66000278    | NOMBRECCLXXVIII    | PRIAPELLIDOCCLXXVIII    | SEGAPELLIDOCCLXXVIII     | 66000278test@gmail.com        | ·Aaaaaaa1      | ·Aaaaaaa1       |
        | 66000279       | 66000279    | NOMBRECCLXXIX      | PRIAPELLIDOCCLXXIX      | SEGAPELLIDOCCLXXIX       | 66000279test@gmail.com        | Aaaaaaa1·	  | Aaaaaaa1·       |
        | 66000280       | 66000280    | NOMBRECCLXXX       | PRIAPELLIDOCCLXXX       | SEGAPELLIDOCCLXXX        | 66000280test@gmail.com        | ········       | ········        |
        | 66000281       | 66000281    | NOMBRECCLXXXI      | PRIAPELLIDOCCLXXXI      | SEGAPELLIDOCCLXXXI       | 66000281test@gmail.com        | A·a·a·a1       | A·a·a·a1        |
        | 66000282       | 66000282    | NOMBRECCLXXXII     | PRIAPELLIDOCCLXXXII     | SEGAPELLIDOCCLXXXII      | 66000282test@gmail.com        | A······a1      | A······a1       |
        | 66000283       | 66000283    | NOMBRECCLXXXIII    | PRIAPELLIDOCCLXXXIII    | SEGAPELLIDOCCLXXXIII     | 66000283test@gmail.com        | Aa1·····	      | Aa1·····        |
        | 66000284       | 66000284    | NOMBRECCLXXXIV     | PRIAPELLIDOCCLXXXIV     | SEGAPELLIDOCCLXXXIV      | 66000284test@gmail.com        | ·····Aa1       | ·····Aa1        |
        | 66000285       | 66000285    | NOMBRECCLXXXV      | PRIAPELLIDOCCLXXXV      | SEGAPELLIDOCCLXXXV       | 66000285test@gmail.com        | Aa······· 	  | Aa·······       |
        | 66000286       | 66000286    | NOMBRECCLXXXVI     | PRIAPELLIDOCCLXXXVI     | SEGAPELLIDOCCLXXXVI      | 66000286test@gmail.com        | a1·······	  | a1·······       |
        | 66000287       | 66000287    | NOMBRECCLXXXVII    | PRIAPELLIDOCCLXXXVII    | SEGAPELLIDOCCLXXXVII     | 66000287test@gmail.com        | A1·······	  | A1·······       |





Scenario Outline: INW-88 - Quick registration with a "Password" that doesn't fit the valid format
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
    And The field "Password" should contain the following error messages
        | Invalid Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names               | FirstSurname             | SecondSurname            | Email                         | Password   | RepeatPassword |
        | 66000288       | 66000288    | NOMBRECCLXXXVIII    | PRIAPELLIDOCCLXXXVIII    | SEGAPELLIDOCCLXXXVIII     | 66000288test@gmail.com        | AAAAAAA1   | AAAAAAA1       |
        | 66000289       | 66000289    | NOMBRECCLXXXIX      | PRIAPELLIDOCCLXXXIX      | SEGAPELLIDOCCLXXXIX       | 66000289test@gmail.com        | aaaaaaa1   | aaaaaaa1       |
        | 66000290       | 66000290    | NOMBRECCXC          | PRIAPELLIDOCCXC          | SEGAPELLIDOCCXC           | 66000290test@gmail.com        | Aaaaaaaa   | Aaaaaaaa       |
        | 66000291       | 66000291    | NOMBRECCXCI         | PRIAPELLIDOCCXCI         | SEGAPELLIDOCCXCI          | 66000291test@gmail.com        | AAAAAA1.   | AAAAAA1.       |
        | 66000292       | 66000292    | NOMBRECCXCII        | PRIAPELLIDOCCXCII        | SEGAPELLIDOCCXCII         | 66000292test@gmail.com        | aaaaaa1.   | aaaaaa1.       |
        | 66000293       | 66000293    | NOMBRECCXCIII       | PRIAPELLIDOCCXCIII       | SEGAPELLIDOCCXCIII        | 66000293test@gmail.com        | Aaaaaaa.   | Aaaaaaa.       |




Scenario Outline: INW-89 - Quick registration with a "Password" that has insufficient length
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
    And The field "Password" should contain the following error messages
        | Insufficient Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names            | FirstSurname           | SecondSurname           | Email                      | Password | RepeatPassword |
        | 66000294       | 66000294    | NOMBRECCXCIV     | PRIAPELLIDOCCXCIV      | SEGAPELLIDOCCXCIV       | 66000294test@gmail.com      | Aaaaaa1  | Aaaaaa1        |



Scenario Outline: INW-90 - Quick registration with a "Password" that has excessive length
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
    And The field "Password" should contain the following error messages
        | Insufficient Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names           | FirstSurname         | SecondSurname       | Email                      | Password                                                                                                                                                                                                                                         | RepeatPassword                                                                                                                                                                                                                                      |
        | 66000295       | 66000295    | NOMBRECCXCV     | PRIAPELLIDOCCXCV     | SEGAPELLIDOCCXCV    | 66000295test@gmail.com     | Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1 | Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1    |



Scenario Outline: INW-91 - Quick registration changing invalid "Password" to a valid one
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
        | DocumentNumber | Cellphone   | Names             | FirstSurname             | SecondSurname             | Email                       | Password   | RepeatPassword | DocumentNumberChanged   | CellphoneChanged  | NamesChanged      | FirstSurnameChanged       | SecondSurnameChanged      | EmailChanged                  | PasswordChanged | RepeatPasswordChanged |
        | 66000296       | 66000296    | NOMBRECCXCVI      | PRIAPELLIDOCCXCVI        | SEGAPELLIDOCCXCVI         | 66000296test@gmail.com      | ""         | ""             | 66000296                | 66000296          | NOMBRECCXCVI      | PRIAPELLIDOCCXCVI         | SEGAPELLIDOCCXCVI         | 66000296test@gmail.com        | Aaaaaaa1        | Aaaaaaa1              |
        | 66000297       | 66000297    | NOMBRECCXCVII     | PRIAPELLIDOCCXCVII       | SEGAPELLIDOCCXCVII        | 66000297test@gmail.com      | 1aA        | 1aA            | 66000297                | 66000297          | NOMBRECCXCVII     | PRIAPELLIDOCCXCVII        | SEGAPELLIDOCCXCVII        | 66000297test@gmail.com        | Aaaaaaa1        | Aaaaaaa1              |
        | 66000298       | 66000298    | NOMBRECCXCVIII    | PRIAPELLIDOCCXCVIII      | SEGAPELLIDOCCXCVIII       | 66000298test@gmail.com      | Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1 | Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1Aaaaaaaaa1 | 66000298       | 66000298    | NOMBRECCXCVIII    | PRIAPELLIDOCCXCVIII      | SEGAPELLIDOCCXCVIII       | 66000298test@gmail.com      | Aaaaaaa1 | Aaaaaaa1  |
        | 66000299       | 66000299    | NOMBRECCXCIX      | PRIAPELLIDOCCXCIX        | SEGAPELLIDOCCXCIX         | 66000299test@gmail.com      | a1111111   | a1111111       | 66000299                | 66000299          | NOMBRECCXCIX      | PRIAPELLIDOCCXCIX         | SEGAPELLIDOCCXCIX         | 66000299test@gmail.com        | a111111A        | a111111A              |





 Scenario Outline: INW-92 - Quick registration entering a previously registered "Password" credential
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
        | DocumentNumber    | Cellphone   | Names           | FirstSurname      | SecondSurname       | Email                   | Password      | RepeatPassword | NewDocumentNumber    | NewCellphone  | NewNames      | NewFirstSurname       | NewSecondSurname     | NewEmail                | NewPassword      | NewRepeatPassword |
        | 66000300          | 66000300    | NOMBRECCC       | PRIAPELLIDOCCC    | SEGAPELLIDOCCC      | 66000300test@gmail.com  | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000301             | 66000301      | NOMBRECCCI    | PRIAPELLIDOCCCI       | SEGAPELLIDOCCCI      | 66000301test@gmail.com  | Aaaaaaaaa1       | Aaaaaaaaa1        |
  



Scenario Outline: INW-184 - Quick registration with a "Password" that contains an invalid format and space characters
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
    And The field "Password" should contain the following error messages
        | Space Characters      |
        | Invalid Format        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password   | RepeatPassword |
        | 66000409       | 66000409    | NOMCDIX  | PRIAPCDIX     | SEGAPCDIX      | 66000409test@gmail.com  | Aaaaa·····  | Aaaaa·····          |




Scenario Outline: INW-185 - Quick registration with a "Password" that contains an invalid format and insufficient characters
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
    And The field "Password" should contain the following error messages
        | Insufficient Characters      |
        | Invalid Format        |

    Examples:
        | DocumentNumber | Cellphone   | Names      | FirstSurname | SecondSurname | Email                  | Password | RepeatPassword |
        | 66000410       | 66000410    | NOMCDX     | PRIAPCDX     | SEGAPCDX      | 66000410test@gmail.com  | Aaaaa    | Aaaaa          |



Scenario Outline: INW-186 - Quick registration with a "Password" that contains an invalid format and excessive characters
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
    And The field "Password" should contain the following error messages
        | Too Many Characters      |
        | Invalid Format        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password                                                                 | RepeatPassword                                                            |
        | 66000411       | 66000411    | NOMCDXI | PRIAPCDXI     | SEGAPCDXI      | 66000411test@gmail.com  | Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa      | Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       |



Scenario Outline: INW-187 - Quick registration with a "Password" that contains an invalid format and excessive characters
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
    And The field "Password" should contain the following error messages
        | Space Characters      |
        | Insufficient Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password | RepeatPassword |
        | 66000412       | 66000412    | NOMCDXII | PRIAPCDXII   | SEGAPCDXII    | 66000412test@gmail.com | A···a1   | A···a1         |



Scenario Outline: INW-188 - Quick registration with a "Password" that contains an invalid format and excessive characters
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
    And The field "Password" should contain the following error messages
        | Space Characters      |
        | Too Many Characters        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password                                                                                | RepeatPassword                                                                        |
        | 66000413       | 66000413    | NOMCDXIII| PRIAPCDXIII  | SEGAPCDXIII   | 66000413test@gmail.com | A·················································································a1    | A·················································································a1  |




Scenario Outline: INW-189 - Quick registration with a "Password" that contains an invalid format and excessive characters
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
    And The field "Password" should contain the following error messages
        | Space Characters      |
        | Insufficient Characters        |
        | Invalid Format        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password | RepeatPassword |
        | 66000414       | 66000414    | NOMCDXIV | PRIAPCDXIV   | SEGAPCDXIV    | 66000414test@gmail.com | A··a     | A··a           |



Scenario Outline: INW-190 - Quick registration with a "Password" that contains an invalid format and excessive characters
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
    And The field "Password" should contain the following error messages
        | Space Characters      |
        | Excessive Characters        |
        | Invalid Format        |

    Examples:
        | DocumentNumber | Cellphone   | Names    | FirstSurname | SecondSurname | Email                  | Password                                                                            | RepeatPassword                                                                        |
        | 66000415       | 66000415    | NOMCDXV  | PRIAPCDXV    | SEGAPCDXV     | 66000415test@gmail.com | A·················································································a | A·················································································a   |

