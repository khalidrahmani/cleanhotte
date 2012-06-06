use Rack::Static, 
  :urls => ["/stylesheets", "/images"],
  :root => "public"
use Rack::Rewrite do
  rewrite '/', 'public/index.html'
end
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