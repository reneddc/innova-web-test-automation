require 'write_xlsx'

class UserRegistered
  def initialize(file = 'usuarios_registrados.xlsx')
    @excel_file = file

    unless File.exist?(@excel_file)
      workbook = WriteXLSX.new(@excel_file)
      worksheet = workbook.add_worksheet
      worksheet.write(0, 0, 'documento')
      worksheet.write(0, 1, 'Correo')
      worksheet.write(0, 2, 'Celular')
      worksheet.write(0, 3, 'Contraseña')
      workbook.close
    end
  end

  def register_user(document, email, cellphone, password)
    require 'roo'
    
    # Cargar datos existentes
    temp_data = []
    book = Roo::Spreadsheet.open(@excel_file)
    sheet = book.sheet(0)
    sheet.each_row_streaming do |row|
      temp_data << row.map(&:value)
    end
  
    # Verificar duplicados (en document, email o cellphone)
    exists = temp_data.any? do |row|
      row[0] == document || row[1] == email || row[2] == cellphone
    end
  
    if exists
      # puts "El usuario ya existe (documento, correo o celular duplicado). No se registrará."
      return
    end
  
    # Agregar nuevo usuario
    temp_data << [document, email, cellphone, password]
  
    # Escribir nuevamente el archivo con los datos actualizados
    workbook = WriteXLSX.new(@excel_file)
    worksheet = workbook.add_worksheet
    temp_data.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        worksheet.write(i, j, cell)
      end
    end
    workbook.close
  
    #puts "Usuario registrado exitosamente."
  end
end

