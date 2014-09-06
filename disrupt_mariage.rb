require 'rubygems'
require 'sinatra'
require 'thin'

get '/' do
<<EOF
  <html><head><title>Here Is The Page</title></head>
  <body><h3>Here Is The Page</h3>
  </body></html>
EOF
end

post '/' do
end

