use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/references"],
  :root => "public",
  :try => ['.html', 'index.html', '/index.html']

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86000' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}
