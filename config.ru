use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/references" => "/references.html"],
  :root => "public"

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
