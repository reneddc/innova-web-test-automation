CARD_TITLES = {
  success_register: "Ciudadano registrado !!!",
  empty_form:       "Error en correo electrónico",
}

DOCUMENT_NUMBER_MESSAGES = {
  "Empty Field" => "El campo número documento es obligatorio.",
  "Invalid Alphabetic Characters" => 'Formato inválido de "Número de documento". (Caracteres alfabéticos inválidas)',
  "Invalid Special Characters" => 'Formato inválido de "Número de documento". (Caracteres especiales inválidos)',  
  "Space Characters" => 'Formato inválido de "Número de documento". (Caracteres de Espacio)',
  "Insufficient Characters" => 'El campo número documento debe contener al menos 4 caracteres.',
  "Too Many Characters" => 'número documento no debe ser mayor que 15 caracteres.',
  "Already Registered" => 'El número documento ya se encuentra registrado.',
}

NAMES_MESSAGES = {
  "Empty Field" => "nombres es obligatorio.",
  "Numeric Characters" => 'Solo se permite letras y espacios en nombres',
  "Invalid Special Characters" => 'Solo se permite letras y espacios en nombres',
  "Invalid Space Characters" => 'Mensaje sin definir (Caracteres de Espacio Invalidos)',
  "Insufficient Characters" => 'El campo nombres debe contener al menos 2 caracteres.',
  "Too Many Characters" => 'nombres no debe ser mayor que 50 caracteres.',
}

FIRST_SURNAME_MESSAGES = {
  "Empty Field" => "El campo 'Nombres' es obligatorio.",
}

SECOND_SURNAME_MESSAGES = {
  "Empty Field" => "",
}

CELLPHONE_MESSAGES = {
  "Empty Field" => "El campo celular es obligatorio.",
  "Alphabetic Characters" => 'Formato inválido de "Celular". (Caracteres alfabéticos inválidas)',
  "Invalid Special Characters" => 'Formato inválido de "Celular". (Caracteres especiales inválidos)', 
  "Space Characters" => 'Formato inválido de "Celular". (Caracteres de Espacio)',
  "Start with 6 or 7 " => 'El número de celular debe iniciar con 6 o 7',
  "Insufficient Characters" => 'celular debe tener 8 dígitos',
  "Too Many Characters" => 'celular debe tener 8 dígitos',
  "Already Registered" => 'El celular ya se encuentra registrado.',
}

EMAIL_MESSAGES = {
  "Empty Field" => "El campo 'Correo Electrónico' es obligatorio.",
}

PASSWORD_MESSAGES = {
  "Empty Field" => "contraseña es obligatorio.",
}

REPEAT_PASSWORD_MESSAGES = {
  "Empty Field" => "repetir contraseña es obligatorio.",
}


FIELDS_MESSAGES = {
  "Document Number" => DOCUMENT_NUMBER_MESSAGES,
  "Names" => NAMES_MESSAGES,
  "First Surname" => FIRST_SURNAME_MESSAGES,
  "Second Surname" => SECOND_SURNAME_MESSAGES,
  "Cellphone" => CELLPHONE_MESSAGES,
  "Email" => EMAIL_MESSAGES,
  "Password" => PASSWORD_MESSAGES,
  "Repeat Password" => REPEAT_PASSWORD_MESSAGES,
}