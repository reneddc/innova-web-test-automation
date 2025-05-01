Before do
    @browser = Watir::Browser.new :chrome
  end
  
  After do
    @browser.close
  end
  
  After do |scenario|
    if scenario.failed?
      timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
      filename = "screenshot_#{timestamp}.png"
      path = File.join('screenshots', filename)
  
      # Asegúrate de que exista la carpeta
      FileUtils.mkdir_p('screenshots')
  
      # Toma el screenshot si @browser está disponible
      if defined?(@browser) && @browser&.exists?
        @browser.screenshot.save(path)
        puts "📸 Screenshot guardado en: #{path}"
      else
        puts "❗ No se pudo tomar screenshot: navegador no disponible"
      end
    end
  end
  