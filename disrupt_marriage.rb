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
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "POST"

{score: 95}.to_json
end

