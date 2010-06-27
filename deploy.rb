require 'net/ftp'
require 'Find'

class String
#  http://snippets.dzone.com/posts/show/7419
  def -(s2)
    self[/#{Regexp.escape(s2)}/]
    $' # remainder
  end  
end

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
      
     upload_file = file.to_s - Dir.pwd.to_s 
     puts "uploading #{ upload_file}"
      
     ftp.put(file)      
    end
    puts "files uploaded"
  end

