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


options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"

  # Needed for AngularJS
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

  halt HTTP_STATUS_OK
end
