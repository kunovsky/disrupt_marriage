require 'rubygems'
require 'sinatra'
require 'thin'
require 'json'

EMOTIONS = {"Anger"=>"bad", "Disgust"=>"bad", "Fear"=>"bad", "Joy"=>"good", "Neutral"=>"good", "Sadness"=>"bad", "Surprise" => "good"}

get '/' do
<<EOF
  <html><head><title>Here Is The Page</title></head>
  <body><h3>Here Is The Page</h3>
  </body></html>
EOF
end

post '/process' do
  couple_results = []
  JSON.parse(params["emovuData"]).each do |user|

    counter = 1
    results = {}

    user["VideoFrameResults"].each do |result|
      max = 0
      type = ""
      result["EmotionResult"].each do |key, value|
        if value > max
          type, max = key, value 
        end
      end
      results[counter] = EMOTIONS[type]
      counter+=1
    end

    overall_scores = {good: 0, bad: 0}

    results.values.each do |value|
      overall_scores[:good] +=1 if value == 'good'
      overall_scores[:bad] +=1 if value == 'bad'
    end

    if (overall_scores[:good].to_f/ overall_scores[:bad]) >=1
      couple_results << {score: (overall_scores[:good].to_f/ overall_scores[:bad]), type: :good}
    else
      couple_results << {score: (overall_scores[:good].to_f/ overall_scores[:bad]), type: :bad}
    end
    final = {}
    if couple_results[0][:score] <= 1 && couple_results[1][:score] <= 1
      final[:score] = :bad
      final[:partner_1] = couple_results[0][:score]
      final[:partner_2] = couple_results[1][:score]
    else
      final[:score] = :good
      final[:partner_1] = couple_results[0][:score]
      final[:partner_2] = couple_results[1][:score]
    end 
  end
  final.to_json
end

options '/*' do
  response.headers['Allows'] = "HEAD,GET,PUT,DELETE,OPTIONS"
  # Needed for AngularJS
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Expose-Headers'] = 'ETag'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
  response.headers['Access-Control-Max-Age'] = '86400'
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
  halt 200
end