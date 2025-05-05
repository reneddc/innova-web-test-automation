Feature: Validate the Quick registration focused on "Email" field

  Background:
    Given I am on the Log In page of INNOVA
    When I press the 'Quick Registration' option
    Then I am redirected to the 'Quick Registration' page


Scenario Outline: INW-65 - Quick Registration attempt with missing "Email" field
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The following fields should display the "Empty Field" error message
      | Email |

    Examples:
        | DocumentNumber | Cellphone   | Names        | FirstSurname      | SecondSurname      | Email     | Password   | RepeatPassword |
        | 66000192       | 66000192    | NOMBRECXCII  | PRIAPELLIDOCXCII  | SEGAPELLIDOCXCII   | ""        | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-66 - Quick registration with an "Email" credential that contains numbers in the username section
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
        | DocumentNumber | Cellphone   | Names         | FirstSurname        | SecondSurname        | Email                        | Password   | RepeatPassword |
        | 66000193       | 66000193    | NOMBRECXCIII  | PRIAPELLIDOCXCIII   | SEGAPELLIDOCXCIII    | 66000193test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000194       | 66000194    | NOMBRECXCIV   | PRIAPELLIDOCXCIV    | SEGAPELLIDOCXCIV     | test66000194@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000195       | 66000195    | NOMBRECXCV    | PRIAPELLIDOCXCV     | SEGAPELLIDOCXCV      | test66000195test@gmail.com   | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000196       | 66000196    | NOMBRECXCVI   | PRIAPELLIDOCXCVI    | SEGAPELLIDOCXCVI     | 66000196@gmail.com           | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-67 - Quick registration with an "Email" credential that contains valid special characters in the username section
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
        | DocumentNumber | Cellphone   | Names          | FirstSurname         | SecondSurname         | Email                        | Password   | RepeatPassword |
        | 66000197       | 66000197    | NOMBRECXCVII   | PRIAPELLIDOCXCVII    | SEGAPELLIDOCXCVII     | 66000197_test@gmail.com      | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000198       | 66000198    | NOMBRECXCVIII  | PRIAPELLIDOCXCVIII   | SEGAPELLIDOCXCVIII    | 66000198.test@gmail.com      | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000199       | 66000199    | NOMBRECXCIX    | PRIAPELLIDOCXCIX     | SEGAPELLIDOCXCIX      | 66000199-test@gmail.com      | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-68 - Quick registration with an "Email" credential that contains invalid special characters in the username section
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Invalid Special Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname        | SecondSurname        | Email                         | Password   | RepeatPassword |
        | 66000200       | 66000200    | NOMBRECC      | PRIAPELLIDOCC       | SEGAPELLIDOCC        | 66000200/test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000201       | 66000201    | NOMBRECCI     | PRIAPELLIDOCCI      | SEGAPELLIDOCCI       | 66000201$test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000202       | 66000202    | NOMBRECCII    | PRIAPELLIDOCCII     | SEGAPELLIDOCCII      | 66000202,test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000203       | 66000203    | NOMBRECCIII   | PRIAPELLIDOCCIII    | SEGAPELLIDOCCIII     | 66000203'test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000204       | 66000204    | NOMBRECCIV    | PRIAPELLIDOCCIV     | SEGAPELLIDOCCIV      | 66000204(t)est@gmail.com      | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-69 - Quick registration with an "Email" credential that contains space characters
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Space Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname        | SecondSurname        | Email                         | Password   | RepeatPassword |
        | 66000205       | 66000205    | NOMBRECCV     | PRIAPELLIDOCCV      | SEGAPELLIDOCCV       | 66000205·test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000206       | 66000206    | NOMBRECCVI    | PRIAPELLIDOCCVI     | SEGAPELLIDOCCVI      | 66000206test@gm·ail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000207       | 66000207    | NOMBRECCVII   | PRIAPELLIDOCCVII    | SEGAPELLIDOCCVII     | 66000207test@gmail.co·m       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000208       | 66000208    | NOMBRECCVIII  | PRIAPELLIDOCCVIII   | SEGAPELLIDOCCVIII    | ········                      | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000209       | 66000209    | NOMBRECCIX    | PRIAPELLIDOCCIX     | SEGAPELLIDOCCIX      | ···66000209test@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000210       | 66000210    | NOMBRECCX     | PRIAPELLIDOCCX      | SEGAPELLIDOCCX       | 66000210test@gmail.com···     | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-70 - Quick registration with an "Email" credential without "@" character
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Invalid Email Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname        | SecondSurname        | Email                          | Password   | RepeatPassword |
        | 66000211       | 66000211    | NOMBRECCXI    | PRIAPELLIDOCCXI     | SEGAPELLIDOCCXI      | 66000211testgmail.com          | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000212       | 66000212    | NOMBRECCXII   | PRIAPELLIDOCCXII    | SEGAPELLIDOCCXII     | 66000212test.gmail.com         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000213       | 66000213    | NOMBRECCXIII  | PRIAPELLIDOCCXIII   | SEGAPELLIDOCCXIII    | 66000213test-gmail.com         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000214       | 66000214    | NOMBRECCXIV   | PRIAPELLIDOCCXIV    | SEGAPELLIDOCCXIV     | 66000214test gmail.com         | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-71 - Quick registration with an "Email" credential without "." character
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Invalid Email Format   |

    Examples:
        | DocumentNumber | Cellphone   | Names          | FirstSurname         | SecondSurname         | Email                          | Password   | RepeatPassword |
        | 66000215       | 66000215    | NOMBRECCXV     | PRIAPELLIDOCCXV      | SEGAPELLIDOCCXV       | 66000215test@gmailcom          | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000216       | 66000216    | NOMBRECCXVI    | PRIAPELLIDOCCXVI     | SEGAPELLIDOCCXVI      | 66000216test@gmail@com         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000217       | 66000217    | NOMBRECCXVII   | PRIAPELLIDOCCXVII    | SEGAPELLIDOCCXVII     | 66000217test@gmail-com         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000218       | 66000218    | NOMBRECCXVIII  | PRIAPELLIDOCCXVIII   | SEGAPELLIDOCCXVIII    | 66000218test@gmail.com         | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-72 - Quick registration with an "Email" credential that doesn't fit the email format in username section
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page

    Examples:
        | DocumentNumber | Cellphone   | Names          | FirstSurname          | SecondSurname           | Email                          | Password   | RepeatPassword |
        | 66000219       | 66000219    | NOMBRECCXIX     | PRIAPELLIDOCCXIX      | SEGAPELLIDOCCXIX        | 66000219..test@gmail.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000220       | 66000220    | NOMBRECCXX      | PRIAPELLIDOCCXX       | SEGAPELLIDOCCXX         | .66000220test@gmail.com        | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000221       | 66000221    | NOMBRECCXXI     | PRIAPELLIDOCCXXI      | SEGAPELLIDOCCXXI        | 66000221test-@gmail.com        | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000222       | 66000222    | NOMBRECCXXII    | PRIAPELLIDOCCXXII     | SEGAPELLIDOCCXXII       | @gmail.com                     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000223       | 66000223    | NOMBRECCXXIII   | PRIAPELLIDOCCXXIII    | SEGAPELLIDOCCXXIII      | 66000223_-.test@gmail.com      | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-73 - Quick registration with an "Email" credential with valid organization domains 
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
        | DocumentNumber | Cellphone   | Names            | FirstSurname            | SecondSurname             | Email                          | Password   | RepeatPassword |
        | 66000224       | 66000224    | NOMBRECCXXIV     | PRIAPELLIDOCCXXIV       | SEGAPELLIDOCCXXIV         | 66000224test@gmail.com          | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000225       | 66000225    | NOMBRECCXXV      | PRIAPELLIDOCCXXV        | SEGAPELLIDOCCXXV          | 66000225test@hotmail.com        | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000226       | 66000226    | NOMBRECCXXVI     | PRIAPELLIDOCCXXVI       | SEGAPELLIDOCCXXVI         | 66000226test@yahoo.com          | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000227       | 66000227    | NOMBRECCXXVII    | PRIAPELLIDOCCXXVII      | SEGAPELLIDOCCXXVII        | 66000227test@live.com           | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000228       | 66000228    | NOMBRECCXXVIII   | PRIAPELLIDOCCXXVIII     | SEGAPELLIDOCCXXVIII       | 66000228test@cochabamba.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000229       | 66000229    | NOMBRECCXXIX     | PRIAPELLIDOCCXXIX       | SEGAPELLIDOCCXXIX         | 66000229test@outlook.com        | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000230       | 66000230    | NOMBRECCXXX      | PRIAPELLIDOCCXXX        | SEGAPELLIDOCCXXX          | 66000230test@nuevatel.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-74 - Quick registration with an "Email" credential that doesn't fit the email format in organization domain section
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page

    Examples:
        | DocumentNumber | Cellphone   | Names            | FirstSurname         | SecondSurname         | Email                      | Password   | RepeatPassword |
        | 66000231       | 66000231    | NOMBRECCXXXI     | PRIAPELLIDOCCXXXI     | SEGAPELLIDOCCXXXI      | 66000231test@correo.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000232       | 66000232    | NOMBRECCXXXII    | PRIAPELLIDOCCXXXII    | SEGAPELLIDOCCXXXII     | 66000232test@umss.com       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000233       | 66000233    | NOMBRECCXXXIII   | PRIAPELLIDOCCXXXIII   | SEGAPELLIDOCCXXXIII    | 66000233test@.com           | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000234       | 66000234    | NOMBRECCXXXIV    | PRIAPELLIDOCCXXXIV    | SEGAPELLIDOCCXXXIV     | 66000234test@gma..il.com    | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000235       | 66000235    | NOMBRECCXXXV     | PRIAPELLIDOCCXXXV     | SEGAPELLIDOCCXXXV      | 66000235test@.gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000236       | 66000236    | NOMBRECCXXXVI    | PRIAPELLIDOCCXXXVI    | SEGAPELLIDOCCXXXVI     | 66000236test@gmail..com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000237       | 66000237    | NOMBRECCXXXVII   | PRIAPELLIDOCCXXXVII   | SEGAPELLIDOCCXXXVII    | 66000237test@gm-ail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000238       | 66000238    | NOMBRECCXXXVIII  | PRIAPELLIDOCCXXXVIII  | SEGAPELLIDOCCXXXVIII   | 66000238test@g.com          | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-75 - Quick registration with an "Email" credential with valid extension domains
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
        | DocumentNumber | Cellphone   | Names          | FirstSurname        | SecondSurname        | Email                     | Password   | RepeatPassword |
        | 66000239       | 66000239    | NOMBRECCXXXIX  | PRIAPELLIDOCCXXXIX   | SEGAPELLIDOCCXXXIX    | 66000239test@gmail.com     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000240       | 66000240    | NOMBRECCXL     | PRIAPELLIDOCCXL      | SEGAPELLIDOCCXL       | 66000240test@gmail.org     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000241       | 66000241    | NOMBRECCXLI    | PRIAPELLIDOCCXLI     | SEGAPELLIDOCCXLI      | 66000241test@gmail.bo      | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000242       | 66000242    | NOMBRECCXLII   | PRIAPELLIDOCCXLII    | SEGAPELLIDOCCXLII     | 66000242test@gmail.es      | Aaaaaaaaa1 | Aaaaaaaaa1     |



Scenario Outline: INW-76 - Quick registration with an "Email" credential that doesn't fit the email format in extension domain section
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page

    Examples:
        | DocumentNumber | Cellphone   | Names          | FirstSurname         | SecondSurname         | Email                          | Password   | RepeatPassword |
        | 66000243       | 66000243    | NOMBRECCXLIII  | PRIAPELLIDOCCXLIII   | SEGAPELLIDOCCXLIII     | 66000243test@gmail.correo       | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000244       | 66000244    | NOMBRECCXLIV   | PRIAPELLIDOCCXLIV    | SEGAPELLIDOCCXLIV      | 66000244test@gmail.             | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000245       | 66000245    | NOMBRECCXLV    | PRIAPELLIDOCCXLV     | SEGAPELLIDOCCXLV       | 66000245test@gmail.com..co      | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000246       | 66000246    | NOMBRECCXLVI   | PRIAPELLIDOCCXLVI    | SEGAPELLIDOCCXLVI      | 66000246test@gmail.com.         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000247       | 66000247    | NOMBRECCXLVII  | PRIAPELLIDOCCXLVII   | SEGAPELLIDOCCXLVII     | 66000247test@gmail.-com         | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000248       | 66000248    | NOMBRECCXLVIII | PRIAPELLIDOCCXLVIII  | SEGAPELLIDOCCXLVIII    | 66000248test@gmail.co_mm        | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000249       | 66000249    | NOMBRECCXLIX   | PRIAPELLIDOCCXLIX    | SEGAPELLIDOCCXLIX      | 66000249test@gmail.c            | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000250       | 66000250    | NOMBRECCL      | PRIAPELLIDOCCL       | SEGAPELLIDOCCL         | 66000250test@gmail.cóm          | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-77 - Quick registration with an "Email" credential that has insufficient length
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Insufficient Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email     | Password   | RepeatPassword |
        | 66000251       | 66000251    | NOMBRECCLI    | PRIAPELLIDOCCLI    | SEGAPELLIDOCCLI     | t@g.c     | Aaaaaaaaa1 | Aaaaaaaaa1     |
        | 66000252       | 66000252    | NOMBRECCLII   | PRIAPELLIDOCCLII   | SEGAPELLIDOCCLII    | t         | Aaaaaaaaa1 | Aaaaaaaaa1     |




Scenario Outline: INW-78 - Quick registration with an "Email" credential that has excessive length
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
    And The quick registration attempt should fail
    And I accept the failed registration message
    And The user should still on the 'Quick Registration' page
    And The field "First Surname" should contain the following error messages
        | Too Many Characters   |

    Examples:
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email     | Password   | RepeatPassword |
        | 66000253       | 66000253    | NOMBRECCLIII  | PRIAPELLIDOCCLIII  | SEGAPELLIDOCCLIII   | testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest@gmail.com | Aaaaaaaaa1 | Aaaaaaaaa1 |




Scenario Outline: INW-79 - Quick registration changing invalid "Email" to a valid one
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
        | DocumentNumber | Cellphone   | Names         | FirstSurname       | SecondSurname       | Email                   | Password      | RepeatPassword | DocumentNumberChanged    | CellphoneChanged  | NamesChanged      | FirstSurnameChanged   | SecondSurnameChanged  | EmailChanged                  | PasswordChanged   | RepeatPasswordChanged |
        | 66000254       | 66000254    | NOMBRECCLIV   | PRIAPELLIDOCCLIV   | SEGAPELLIDOCCLIV    | ""                      | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000254                 | 66000254          | NOMBRECCLIV       | PRIAPELLIDOCCLIV      | SEGAPELLIDOCCLIV      | 66000254test@gmail.com        | Aaaaaaaaa1        | Aaaaaaaaa1     |
        | 66000255       | 66000255    | NOMBRECCLV    | PRIAPELLIDOCCLV    | SEGAPELLIDOCCLV     | t                       | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000255                 | 66000255          | NOMBRECCLV        | PRIAPELLIDOCCLV       | SEGAPELLIDOCCLV       | 66000255test@gmail.com        | Aaaaaaaaa1        | Aaaaaaaaa1     |
        | 66000256       | 66000256    | NOMBRECCLVI   | PRIAPELLIDOCCLVI   | SEGAPELLIDOCCLVI    | 66000256test@correo.com | Aaaaaaaaa1    | Aaaaaaaaa1     | 66000256                 | 66000256          | NOMBRECCLVI       | PRIAPELLIDOCCLVI      | SEGAPELLIDOCCLVI      | 66000256test@gmail.com        | Aaaaaaaaa1        | Aaaaaaaaa1     |


 Scenario Outline: INW-80 - Quick registration entering a previously registered "Email" credential
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
        | Email |

    Examples:
        | DocumentNumber    | Cellphone     | Names         | FirstSurname          | SecondSurname        | Email                     | Password   | RepeatPassword | NewDocumentNumber    | NewCellphone  | NewNames      | NewFirstSurname       | NewSecondSurname      | NewEmail                      | NewPassword   | NewRepeatPassword |
        | 66000257          | 66000257      | NOMBRECCLVII  | PRIAPELLIDOCCLVII     | SEGAPELLIDOCCLVII    | 66000257test@gmail.com    | Aaaaaaaaa1 | Aaaaaaaaa1     | 66000258             | 66000258      | NOMBRECCLVIII | PRIAPELLIDOCCLVIII    | SEGAPELLIDOCCLVIII    | 66000257test@gmail.com        | Aaaaaaaaa1    | Aaaaaaaaa1        |

