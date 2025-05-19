class NoRegisterPage

  MODULE_PATHS = {
    'Solicitud de trámites'        => '/tramitesMenu',
    'Trámites'                     => '/tramitesMenu',
    'Pagos'                        => nil,  # no redirige, muestra advertencia
    'Consulta de deuda'            => '/menu-deudas',
    'Preguntas frecuentes'         => '/preguntas-frecuentes',
    'Reclamos'                     => nil,  # no redirige, muestra advertencia
    'Bancos'                       => '/Servicio/lista-bancos',
    'Convalidación de planos'      => nil,  # no redirige, muestra advertencia
    'Taxi seguro'                  => '/Servicio/consulta-taxi-seguro',
    'Hoja de ruta'                 => '/menu-consultaAtlas',
    'Estacionamiento'              => '/Servicio/datosParqueo',
    'Consultas'                    => '/Micasasegura/verificacion-tramite'
  }.freeze

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto('https://innovadev.cochabamba.bo/notregister')
  end

  def on_not_registered_dashboard?
    @browser.url.include?('/notregister')
  end

  def load_elements
    @solicitud_tramites = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[1]/div/a[1]/img')
    @tramites = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[2]/div/a[1]/img')
    @pagos = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[3]/div/a[1]/img')
    @consulta_deuda = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[4]/div/a[1]/img')
    @preguntas_frecuentes = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[5]/div/a[1]/img')
    @reclamos = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[6]/div/a[1]/img')
    @bancos= @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[7]/div/a[1]/img')
    @convalidacion = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[8]/div/a[1]/img')
    @taxi_seguro = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[9]/div/a[1]/img')
    @hoja_de_ruta = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[10]/div/a[1]/img')
    @estacionamiento = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[11]/div/a[1]/img')
    @consultas = @browser.img(xpath: '/html/body/div/div[1]/div/div/div/div/div/div[12]/div/a[1]/img')
  end

  def click_module(name)
    puts "Clicking on module: #{name}"
    load_elements
    case name
      when 'Solicitud de trámites' 
        @solicitud_tramites.click
        puts "Clicked on Solicitud de trámites"
      when 'Trámites'               
        @tramites.click
      when 'Pagos'                 
        @pagos.click
      when 'Consulta de deuda'      
        @consulta_deuda.click
      when 'Preguntas frecuentes'   
        @preguntas_frecuentes.click
      when 'Reclamos'               
        @reclamos.click
      when 'Bancos'                 
         @bancos.click
      when 'Convalidación de planos'
         @convalidacion.click
      when 'Taxi seguro'            
         @taxi_seguro.click
      when 'Hoja de ruta'           
        @hoja_de_ruta.click
      when 'Estacionamiento'       
        @estacionamiento.click
      when 'Consultas'              
         @consultas.click
    else raise "Unknown module: #{name}"
    end
  end

  def warning_message_visible?
    div = @browser.div(xpath: '/html/body/div[2]/div')
    @browser.wait_until(timeout: 3) { div.present? rescue false }
    div.present?
  end

  def on_module_page?(name)
    expected_path = MODULE_PATHS[name]
    return false unless expected_path
    @browser.url.include?(expected_path)
  end
end
