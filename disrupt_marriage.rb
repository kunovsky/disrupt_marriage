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
  response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Allow-Origin'] = '*'
    response['Access-Control-Expose-Headers'] = 'ETag'
    response['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    response['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    response['Access-Control-Max-Age'] = '86400'

  {score: 95}.to_json
end

