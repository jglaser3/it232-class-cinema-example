fh = File.open('movies.txt')

while line = fh.gets
  if ( line =~ /^(.+) \((\d\d\d\d).*\)/ )
    puts "Adding another movie..."
    puts $1
    puts $2
    m = Movie.new
    m.title = $1
    m.year = $2
    m.seen = false
    m.save
  end
end
fh.close
