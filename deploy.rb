require 'net/ftp'
require 'Find'

@exclude_files = [".DS_STORE","ftp.rb","Readme.md"]


Net::FTP.open('drivensoftware.net') do |ftp|
    puts "connecting..."
    ftp.login("garrens","Passw0rd")
    ftp.passive=true
    puts "logged in"
    ftp.chdir('/beta')
    puts "changed dir"
    puts "uploading"
    Find.find(Dir.pwd) do |file|
      next if @exclude_files.include?  File.basename(file)
      Find.prune if File.basename(file)[0] == ?.
      next if File.directory? file     
      
      puts "uploading #{file.to_s}"
      ftp.put(file)      
    end
    puts "files uploaded"
  end

