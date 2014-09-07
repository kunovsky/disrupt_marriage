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
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Expose-Headers'] = 'ETag'
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
  headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
  headers['Access-Control-Max-Age'] = '86400'

  {score: 95}.to_json
end

get '*' do
  response.headers['Allows'] = "HEAD,GET,PUT,DELETE,OPTIONS"
  # Needed for AngularJS
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
  halt 200
end