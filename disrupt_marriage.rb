require 'rubygems'
require 'sinatra'
require 'thin'
require 'json'

get '/' do
<<EOF
  <html><head><title>Here Is The Page</title></head>
  <body><h3>Here Is The Page</h3>
  </body></html>
EOF
end

post '/process' do
{score: 95}.to_json
end

