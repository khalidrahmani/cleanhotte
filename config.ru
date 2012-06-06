use Rack::Static, 
  :urls => ["/stylesheets", "/images"],
  :root => "public"

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=2' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
run lambda { [404, {'Content-Type' => 'text/plain'}, [' File not found.']]}