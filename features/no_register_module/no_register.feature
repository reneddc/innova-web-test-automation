Feature: Access modules without registration

Background:
Given I am on the Login page
When I click the "Ingresar sin registrarse" option
Then I should be on the Not-Registered Dashboard page

@smokeTest 
Scenario: Warning when accessing Solicitud de trámites
When I click the "Solicitud de trámites" module
Then I should see a warning "Debe iniciar sesión para acceder a esta sección"

@smokeTest 
Scenario: Warning when accessing Pagos
When I click the "Pagos" module
Then I should see a warning "Debe iniciar sesión para acceder a esta sección"

@smokeTest 
Scenario: Warning when accessing Reclamos
When I click the "Reclamos" module
Then I should see a warning "Debe iniciar sesión para acceder a esta sección"

@smokeTest 
Scenario: Warning when accessing Convalidación de planos
When I click the "Convalidación de planos" module
Then I should see a warning "Debe iniciar sesión para acceder a esta sección"

@smokeTest 
Scenario: Access Tramites module without login
When I click the "Trámites" module
Then I should be redirected to the "Tramites" module

@smokeTest 
Scenario: Access Consulta de deuda module without login
When I click the "Consulta de deuda" module
Then I should be redirected to the "Consulta de deuda" module


@smokeTest 
Scenario: Access Preguntas frecuentes module without login
When I click the "Preguntas frecuentes" module
Then I should be redirected to the "Preguntas frecuentes" module


@only
@smokeTest 
Scenario: Access Bancos module without login
When I click the "Bancos" module
Then I should be redirected to the "Bancos" module

@smokeTest 
Scenario: Access Taxi seguro module without login
When I click the "Taxi seguro" module
Then I should be redirected to the "Taxi seguro" module

@smokeTest 
Scenario: Access Hoja de ruta module without login
When I click the "Hoja de ruta" module
Then I should be redirected to the "Hoja de ruta" module

@smokeTest 
Scenario: Access Estacionamiento module without login
When I click the "Estacionamiento" module
Then I should be redirected to the "Estacionamiento" module

@smokeTest 
Scenario: Access Consultas module without login
When I click the "Consultas" module
Then I should be redirected to the "Consultas" module
