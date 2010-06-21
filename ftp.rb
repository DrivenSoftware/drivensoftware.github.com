require 'net/ftp'

@files = ["index.html"]


Net::FTP.open('drivensoftware.net') do |ftp|
    puts "connecting..."
    ftp.login("garrens","Passw0rd")
    ftp.passive=true
    puts "logged in"
    ftp.chdir('/beta')
    puts "changed dir"
    puts "uploading"
    Dir.foreach('.') do |file|
       next if File.stat(file).directory?
          puts "uploading #{file.to_s}"
      ftp.put(file)      
    end
    puts "files uploaded"
  end

