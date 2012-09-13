use Rack::Static, 
  :urls => ["/css", "/img", "/js", "/references.html", "/nettoyage-hottes.html"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=604800', 
      'Accept-Encoding'=> 'x-compress; x-zip',
      'Content-Encoding'=> 'gzip'            
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
#604800